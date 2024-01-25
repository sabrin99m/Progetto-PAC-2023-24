// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mountain_app/Managers/EventsManager.dart';
import 'package:mountain_app/Models/Escursione.dart';

class TileView extends StatefulWidget {
  final int idEscursione;

  TileView({super.key, required this.idEscursione});

  @override
  State<TileView> createState() => _TileViewState();
}

class _TileViewState extends State<TileView> {
  late Future<Escursione> escursione;

  void fetchEscursione() async {
    this.escursione = EventsManger().fetchEvent(widget.idEscursione);
  }

  @override
  void initState() {
    super.initState();
    fetchEscursione();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: FutureBuilder<Escursione>(
        future: escursione,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          Escursione downEscursione = snapshot.data!;

          return DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              image: DecorationImage(
                image: AssetImage("images/tagliaferri.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      organizerImageSection(
                        imageAddress:
                            downEscursione.organizzatori[0].urlImmagineProfilo,
                      ),
                      Spacer(),
                      dateTitleDifficultySection(
                        dataEvento: downEscursione.data,
                        nomeEvento: downEscursione.nome,
                        difficolta: downEscursione.difficolta,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("Weather goes here"),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class organizerImageSection extends StatelessWidget {
  final Uri imageAddress;
  const organizerImageSection({
    super.key,
    required this.imageAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(foregroundImage: AssetImage("images/me.jpg")),
        ],
      ),
    );
  }
}

class dateTitleDifficultySection extends StatelessWidget {
  const dateTitleDifficultySection({
    super.key,
    required this.dataEvento,
    required this.nomeEvento,
    required this.difficolta,
  });

  final String dataEvento;
  final String nomeEvento;
  final Difficolta difficolta;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataEvento,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),
              Text(
                nomeEvento,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Difficoltà: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  traduceDifficultyToEmoji(difficolta),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget traduceDifficultyToEmoji(Difficolta difficolta) {
  int numElems = 1;

  switch (difficolta) {
    case Difficolta.hard:
      numElems = 3;
      break;
    case Difficolta.medium:
      numElems = 2;
      break;
    default:
      numElems = 1;
  }

  return Row(
    children: List.generate(
      numElems,
      (index) => Icon(
        Icons.directions_walk_rounded,
        color: Colors.red,
      ),
    ),
  );
}
