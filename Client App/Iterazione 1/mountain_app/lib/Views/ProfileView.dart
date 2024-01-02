import 'package:flutter/material.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Utilities/Constants.dart';
import 'package:mountain_app/Views/EventDetailsView.dart';
import 'package:mountain_app/Views/TileView.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.utente});

  final Utente utente;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              backgroundImageSection(),
              profilePhotoView(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  utente.nome + " " + utente.cognome,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),

                //Only show if it is organizer
                if (utente.isOrganizer) organizerSection(),

                customDivider(),

                Text(
                  "Esperienze Passate",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                Container(
                  height: 1000,
                  child: ListView.builder(
                    itemCount: utente.iscrizioniPassate.length,
                    itemBuilder: (context, index) {
                      // return TileView(escursione: escursioni[index]);
                      return ListTile(
                        title: TileView(
                            escursione: Escursione.escursioniMock[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailsView(
                                  escursione: Escursione.escursioniMock[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row organizerSection() {
    return Row(
      children: [
        Container(
          width: 130,
          child: Text(
            "Organizzatore",
            style: sottotitoloOpaco,
          ),
        ),
        Text(
          utente.punteggio.toString(),
          style: sottotitoloGrassetto,
        ),
        Icon(
          Icons.star,
          size: sottotitoloGrassetto.fontSize,
        )
      ],
    );
  }

  Widget profilePhotoView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
      child: CircleAvatar(
        radius: 70,
        foregroundImage: AssetImage('images/me.jpg'),
      ),
    );
  }

  Container backgroundImageSection() {
    return Container(
      width: 1000,
      child: Image(
          fit: BoxFit.fill, image: AssetImage("images/profileBackground.jpg")),
    );
  }
}
