import 'package:flutter/material.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Utilities/Constants.dart';

class EventDetailsView extends StatelessWidget {
  final Escursione escursione;

  const EventDetailsView({super.key, required this.escursione});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
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
                            gridElement(
                                "Difficoltà", escursione.difficolta.name)
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
                            SizedBox(
                              width: 110,
                              child: Text("Organizzatori > ",
                                  style: sottotitoloGrassetto),
                            ),
                            showListOfPeople(Utente.listaOrganizzatoriMock, 4)
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text("Partecipanti > ",
                                  style: sottotitoloGrassetto),
                            ),
                            showListOfPeople(Utente.listaPartecipantiMock, 4)
                          ],
                        ),
                      ],
                    ),
                  ),
                  customDivider(),
                  CustomInset(Text("Descrizione Percorso",
                      style: sottotitoloGrassetto)),
                  displayTextParagraph(escursione.descrizione),
                  customDivider(),
                  Text("Strumentazione Richiesta", style: sottotitoloGrassetto),
                  displayTextParagraph(escursione.strumentazione),
                  customDivider(),
                  Text("Ritrovo", style: sottotitoloGrassetto),
                  CustomInset(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Orario: ", style: sottotitoloGrassetto),
                          Text(escursione.oraRitrovo)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Luogo: ", style: sottotitoloGrassetto),
                          Text(escursione.luogoRitrovo)
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayTextParagraph(String textToDiplay) {
    return CustomInset(
      Text(textToDiplay, textAlign: TextAlign.justify),
    );
  }

  Widget CustomInset(Widget toInset) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: toInset,
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
    return Container(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          Text(
            text,
            style: sottotitoloGrassetto,
          ),
        ],
      ),
    );
  }

  final TextStyle luogo = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 20,
  );

  final TextStyle data = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 15,
  );
}
