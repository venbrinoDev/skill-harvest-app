import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageCOntroller extends ChangeNotifier {
  bool isBusy = false;

  bool isCheck = false;

  ///CALLL
  void updateCheckBox(bool value) {
    isCheck = value;
    notifyListeners();
  }

  ///This is the login function
  Future<bool> login(String email, String password) async {
    _isBusy(true);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      FirebaseFirestore.instance.collection('users').doc().set({
        "email": email,
        
      });


    
      return true;
    } catch (e) {
      debugPrint('Firebase error $e');
      return false;
    } finally {
      _isBusy(false);
    }
  }

  _isBusy(bool isBusy) {
    this.isBusy = isBusy;
    notifyListeners();
  }
}

class NotiferLoginState extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void call() {
    state = true;
  }
}

class LoginPageStateNotifer extends StateNotifier<bool> {
  Ref ref;
  LoginPageStateNotifer(this.ref) : super(true);
  bool isBusy = false;

  bool isCheck = false;

  ///CALLL
  void updateCheckBox(bool value) {
    state = value;
  }

  ///This is the login function
  Future<bool> login(String email, String password) async {
    _isBusy(true);

    //Fajke api call
    await Future.delayed(const Duration(seconds: 3));

    _isBusy(false);

    return true;
  }

  _isBusy(bool isBusy) {
    this.isBusy = isBusy;
  }
}

final loginController = ChangeNotifierProvider((ref) {
  return LoginPageCOntroller();
});
