import 'package:dairy_management/layout/responsive_layout.dart';
import 'package:dairy_management/screens/home/home_desktop_ui_page.dart';
import 'package:dairy_management/screens/home/home_mobile_ui_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(mobileUiBody: HomeMobileUiPage(), desktopUiBody: HomeDesktopUiPage())
    );
  }
}