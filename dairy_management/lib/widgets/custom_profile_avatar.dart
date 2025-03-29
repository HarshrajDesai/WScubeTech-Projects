import 'package:flutter/material.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key, required this.assetPath});
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      foregroundImage: AssetImage(assetPath),
    );
  }
}