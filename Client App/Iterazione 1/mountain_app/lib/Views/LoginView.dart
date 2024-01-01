import 'package:flutter/material.dart';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Screens/Homepage.dart';
import 'package:mountain_app/Utilities/Constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _usernameFieldController;
  late TextEditingController _passwordFieldcontroller;

  @override
  void initState() {
    super.initState();
    _usernameFieldController = TextEditingController();
    _passwordFieldcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _usernameFieldController.dispose();
    _passwordFieldcontroller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: SizedBox(
                height: 500,
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: titolo,
                        ),
                        Text(
                          "Accedi per iniziare",
                          style: sottotitoloOpaco,
                        ),
                      ],
                    ),
                    Form(
                        key: _formKey,
                        child: Container(
                          height: 210,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Indirizzo Email",
                                        style: sottotitoloGrassetto,
                                      ),
                                      CustomTextField(
                                        Icons.mail_outline,
                                        "Inserisci la tua mail...",
                                        "Inserisci una mail valida",
                                        _usernameFieldController,
                                        false,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Password",
                                        style: sottotitoloGrassetto,
                                      ),
                                      CustomTextField(
                                        Icons.password_outlined,
                                        "Inserisci la tua password...",
                                        "Fornisci una password",
                                        _passwordFieldcontroller,
                                        true,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        )),
                    Center(
                        child: Column(children: [
                      Container(
                        height: 89,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              child: Text(
                                "Accedi",
                                style: sottotitoloGrassetto,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  String username =
                                      _usernameFieldController.text;
                                  String pass = _passwordFieldcontroller.text;
                                  print("Username: $username Password: $pass");
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomepageScreen(
                                      utente: Utente.utenteMock1,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Text(
                              "Oppure registrati",
                              style: sottotitolo,
                            ),
                          ],
                        ),
                      ),
                    ])),
                  ],
                )))
      ],
    ));
  }

  Widget CustomTextField(IconData icon, String hintText, String errorText,
      TextEditingController _controller, bool obscureText) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black38),
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
        prefixIconColor: Colors.black38,
      ),
      controller: _controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }

        return null;
      },
      autocorrect: false,
    );
  }
}
