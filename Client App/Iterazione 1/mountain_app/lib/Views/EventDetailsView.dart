import 'package:flutter/material.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';

class EventDetailsView extends StatelessWidget {
  final Escursione escursione;

  const EventDetailsView({super.key, required this.escursione});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Image(image: AssetImage("images/Tagliaferri.jpg")),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(escursione.luogo, style: luogo),
                    Text(escursione.nome, style: titolo),
                    Text(escursione.data, style: data),
                  ],
                ),
                customDivider(),
                SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          gridElement("Distanza", escursione.distanza),
                          gridElement("Dislivello", escursione.dislivello),
                          gridElement("Tempo", escursione.tempo)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          gridElement("Altezza Max.", escursione.altMax),
                          gridElement("Altezza Min.", escursione.altMin),
                          gridElement("Difficoltà", escursione.difficolta.name)
                        ],
                      )
                    ],
                  ),
                ),
                customDivider(),
                SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text("Organizzatori > ", style: titoletto),
                          showListOfPeople(Utente.listaOrganizzatoriMock, 4)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Partecipanti > ", style: titoletto),
                          showListOfPeople(Utente.listaPartecipantiMock, 4)
                        ],
                      ),
                    ],
                  ),
                ),
                customDivider(),
                Text("Descrizione Percorso", style: titoletto),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Text(
                    escursione.descrizione,
                    textAlign: TextAlign.justify,
                  ),
                ),
                customDivider(),
                Text("Ritrovo", style: titoletto),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showListOfPeople(List<Utente> people, int maxPeopleToDisplay) {
    int excessPeople = 0;
    if (people.length >= maxPeopleToDisplay) {
      excessPeople = people.length - maxPeopleToDisplay;
    }

    return Row(
      children: [
        Row(
          children: List.generate(
            (excessPeople == 0) ? people.length : maxPeopleToDisplay,
            (index) => personFaceView(people[index].urlImmagineProfilo),
          ),
        ),
        if (excessPeople > 0) personFaceView(null, excessPeople)
      ],
    );
  }

  Widget personFaceView([Uri? imageUrl, int? number]) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: (imageUrl != null)
          ? CircleAvatar(foregroundImage: AssetImage("images/me.jpg"))
          : CircleAvatar(child: Text("+$number")),
    );
  }

  Widget gridElement(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        Text(
          text,
          style: titoletto,
        ),
      ],
    );
  }

  Widget customDivider() {
    return const Divider(indent: 16, endIndent: 16);
  }

  final TextStyle titoletto = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 15,
  );

  final TextStyle luogo = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 20,
  );

  final TextStyle titolo = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 30,
  );

  final TextStyle data = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 15,
  );
}
