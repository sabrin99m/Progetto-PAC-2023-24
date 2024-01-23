import 'package:mountain_app/Models/Utente.dart';

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
}
