import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum Status { Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  Status _status = Status.Unauthenticated;
  Status get status => _status;

  Future<void> login(String email, String password) async {
    _status = Status.Authenticating;
    notifyListeners();

    await Future.delayed(
        const Duration(seconds: 2)); // Simulación de autenticación

    if (email == 'sistemas@nextimpulse.mx' && password == 'joba05') {
      _status = Status.Authenticated;
    } else {
      _status = Status.Unauthenticated;
    }
    notifyListeners();
  }
}
