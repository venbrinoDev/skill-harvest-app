import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageCOntroller extends ChangeNotifier {
  bool isBusy = false;

  bool isCheck = false;

  void updateCheckBox(bool value) {
    isCheck = value;
    notifyListeners();
  }

  ///This is the login function
  Future<bool> login(String email, String password) async {
    _isBusy(true);

    //Fajke api call
    await Future.delayed(const Duration(seconds: 3));

    _isBusy(false);

    return false;
  }

  _isBusy(bool isBusy) {
    this.isBusy = isBusy;
    notifyListeners();
  }
}

final loginController = ChangeNotifierProvider((ref) {
  return LoginPageCOntroller();
});
