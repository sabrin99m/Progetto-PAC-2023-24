import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mountain_app/Utilities/Misc.dart';
import 'package:mountain_app/Views/CutomButotns.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 0, 0, 0.1),
      body: Center(
        child: Container(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "error.json",
                repeat: false,
                width: 200,
              ),
              Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: titolo,
                    ),
                    MainButton(
                      text: 'Ritenta',
                      width: 250,
                      borderRadius: 32,
                      color: Colors.red.shade700,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
