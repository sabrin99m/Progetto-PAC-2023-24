import 'package:flutter/material.dart';
import 'package:mountain_app/Managers/EventsManager.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Views/EventDetailsView.dart';
import 'package:mountain_app/Views/EventsListView.dart';
import 'package:mountain_app/Views/TileView.dart';

class ForYouScreen extends StatefulWidget {
  ForYouScreen({
    Key? key,
  }) : super(key: key) {}

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
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

  int translateDifficulty(Difficolta difficolta) {
    switch (difficolta) {
      case Difficolta.easy:
        return 2;

      case Difficolta.medium:
        return 3;

      case Difficolta.hard:
        return 4;
    }
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

            var suggestedEvents = snapshot.data!
                .where((element) =>
                    translateDifficulty(element.difficolta) <=
                    Utente.loggedUser.esperienza)
                .toList();

            return EventsListView(escursioni: suggestedEvents);
          }),
    ));
  }
}
