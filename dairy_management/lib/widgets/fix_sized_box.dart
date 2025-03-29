import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FixSizedBox extends StatelessWidget {
  FixSizedBox({super.key, this.customHeight = 0, this.customWidth = 0});
  double customHeight;
  double customWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: customHeight ==0  ? 20 : customHeight,
      width: customWidth == 0 ? 0 : customWidth,
    );
  }
}