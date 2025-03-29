import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AppBarIcon extends StatelessWidget {
  AppBarIcon({super.key, required this.assetPath, this.isDashboardPage = false, required this.onTapFunc, this.customColor});
  final String assetPath;
  bool isDashboardPage;
  final GestureTapCallback onTapFunc;
  Color? customColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapFunc,
        child: SizedBox(
          height: 30,
          width: 30,
          child: Center(child: SvgPicture.asset(assetPath,color: customColor ?? null,)),
        ),
      );
  }
}