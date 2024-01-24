import 'package:flutter/material.dart';
import 'package:mountain_app/Managers/EventsManager.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Views/EventDetailsView.dart';
import 'package:mountain_app/Views/TileView.dart';

class DestinationsScreen extends StatefulWidget {
  final List<Escursione> escursioni;
  final Utente utente;
  const DestinationsScreen({
    Key? key,
    required this.escursioni,
    required this.utente,
  }) : super(key: key);

  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  @override
  void initState() {
    EventsManger().fetchEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: EventsManger().escursioni.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: TileView(escursione: EventsManger().escursioni[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsView(
                    escursione: EventsManger().escursioni[index],
                    listaEscursioni: Utente.utenteMock1.iscrizioni,
                    utente: widget.utente,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
