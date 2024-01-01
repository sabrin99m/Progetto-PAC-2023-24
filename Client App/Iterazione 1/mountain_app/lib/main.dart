import 'package:flutter/material.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'Screens/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomepageScreen(utente: Utente.utenteMock1),
    );
  }
}
