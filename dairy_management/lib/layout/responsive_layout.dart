import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.mobileUiBody, required this.desktopUiBody});

  final Widget mobileUiBody;
  final Widget desktopUiBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints)=>
    Constraints.maxWidth<600 ? mobileUiBody : desktopUiBody);
  }
}