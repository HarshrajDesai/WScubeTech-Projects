import 'package:dairy_management/layout/responsive_layout.dart';
import 'package:dairy_management/screens/login/login_desktop_ui_page.dart';
import 'package:dairy_management/screens/login/login_mobile_ui_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(mobileUiBody: LoginMobileUiPage(), desktopUiBody: LoginDesktopUiPage())
    );
  }
}
