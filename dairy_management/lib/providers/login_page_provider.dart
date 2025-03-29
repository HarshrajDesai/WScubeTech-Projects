import 'package:flutter/material.dart';

class LoginPageProvider extends ChangeNotifier{

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}