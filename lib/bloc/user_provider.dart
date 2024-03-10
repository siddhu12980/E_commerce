import 'package:e_com/auth/auth_methods.dart';
import 'package:e_com/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();

    _user = user;

    //notify the changes to list erners
    notifyListeners();
  }
}
