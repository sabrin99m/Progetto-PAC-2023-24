import 'package:flutter/material.dart';
import 'package:mountain_app/Managers/EventsManager.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Views/EventDetailsView.dart';
import 'package:mountain_app/Views/TileView.dart';

class DestinationsScreen extends StatefulWidget {
  DestinationsScreen({
    Key? key,
  }) : super(key: key) {}

  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  late Future<List<Escursione>> escursioni;

  void fetchEscursioni() async {
    escursioni = EventsManger()
        .fetchEvents(Utente.loggedUser.mail, Utente.loggedUser.password);
  }

  @override
  void initState() {
    super.initState();
    fetchEscursioni();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Escursione>>(
            future: escursioni,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              var downEscursioni = snapshot.data!;

              return ListView.builder(
                  itemCount: downEscursioni.length,
                  cacheExtent: 10000,
                  itemBuilder: ((context, index) => ListTile(
                        title: TileView(
                          idEscursione: downEscursioni[index].id,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailsView(
                                escursione: downEscursioni[index],
                                listaEscursioni: Utente.utenteMock1.iscrizioni,
                              ),
                            ),
                          );
                        },
                      )));
            }));
  }
}
