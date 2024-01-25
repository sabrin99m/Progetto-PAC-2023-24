import 'package:flutter/material.dart';
import 'package:mountain_app/Managers/EventsManager.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Views/EventsListView.dart';

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
        body: Center(
      child: FutureBuilder<List<Escursione>>(
          future: escursioni,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            List<Escursione> downEscursioni = snapshot.data!;

            return EventsListView(escursioni: downEscursioni);
          }),
    ));
  }
}
