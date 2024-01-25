import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mountain_app/Managers/EventsManager.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Utilities/Constants.dart';
import 'package:mountain_app/Views/EventDetailsView/LoadingSubscibeEventDetailsView.dart';

class EventDetailsView extends StatefulWidget {
  final Escursione escursione;
  final List<int> listaEscursioni;

  EventDetailsView(
      {super.key, required this.escursione, required this.listaEscursioni});

  @override
  State<EventDetailsView> createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends State<EventDetailsView> {
  Utente utente = Utente.loggedUser;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.escursione.luogo, style: luogo),
                          Text(widget.escursione.nome, style: titolo),
                          Text(widget.escursione.data, style: data),
                        ],
                      ),
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
                            gridElement("Distanza", widget.escursione.distanza),
                            gridElement(
                                "Dislivello", widget.escursione.dislivello),
                            gridElement("Tempo", widget.escursione.tempo)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gridElement(
                                "Altezza Max.", widget.escursione.altMax),
                            gridElement(
                                "Altezza Min.", widget.escursione.altMin),
                            gridElement(
                                "Difficoltà", widget.escursione.difficolta.name)
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
                  displayTextParagraph(widget.escursione.descrizione),
                  customDivider(),
                  Text("Strumentazione Richiesta", style: sottotitoloGrassetto),
                  displayTextParagraph(widget.escursione.strumentazione),
                  customDivider(),
                  Text("Ritrovo", style: sottotitoloGrassetto),
                  CustomInset(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Orario: ", style: sottotitoloGrassetto),
                          Text(widget.escursione.oraRitrovo)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Luogo: ", style: sottotitoloGrassetto),
                          Text(widget.escursione.luogoRitrovo)
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isUserSubscribed())
                    unsubscribeButtonSection()
                  else
                    subscribeButtonSection(),
                  if (widget.escursione.organizzatori.contains(utente))
                    deleteEventSection(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget deleteEventSection(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: sottotitolo,
        children: <TextSpan>[
          TextSpan(
              text: 'Cancella evento',
              style: sottotitoloRed,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  int idEvento = widget.escursione.id;
                  EventsManger().deleteEvent(idEvento);
                  Navigator.pop(context);
                }),
        ],
      ),
    );
  }

  Widget subscribeButtonSection() {
    return FloatingActionButton.extended(
      elevation: 0,
      backgroundColor: Colors.green,
      hoverElevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))),
      label: Text(
        "Prenotati a questa escursione",
        style: sottotitoloGrassetto,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoadingSubscribeEventDetailsView(
              idEvent: widget.escursione.id,
            ),
          ),
        );
      },
    );
  }

  Widget unsubscribeButtonSection() {
    return FloatingActionButton.extended(
      elevation: 0,
      backgroundColor: Colors.green,
      hoverElevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))),
      label: Text(
        "Disiscriviti da questa escursione",
        style: sottotitoloGrassetto,
      ),
      onPressed: () {},
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

  bool isUserSubscribed() {
    if (widget.listaEscursioni.contains(widget.escursione.id)) return true;
    return false;
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
