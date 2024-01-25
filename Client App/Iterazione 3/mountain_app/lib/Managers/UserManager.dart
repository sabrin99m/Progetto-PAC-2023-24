import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:mountain_app/Models/Utente.dart';
import 'package:mountain_app/Utilities/ConstantValues.dart';

class UserManager {
  /// Indica se il sistema sta caricando
  late bool isLoading;

  static final UserManager _instance = UserManager._internal();

  factory UserManager() {
    return _instance;
  }

  UserManager._internal() {
    isLoading = false;
  }

  Future<Utente> login(String username, String password) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await http.get(Uri.parse('$baseIpGateway/login'),
        headers: {HttpHeaders.authorizationHeader: basicAuth});

    switch (response.statusCode) {
      case 202:
        var decoded = json.decode(response.body);
        return Utente.fromJson(decoded);

      case 401:
        throw Exception('Login fallito');

      default:
        throw Exception('Fallimento');
    }
  }
}
