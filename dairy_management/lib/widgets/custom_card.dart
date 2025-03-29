import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.childWidget, this.customHeight, this.customWidth, this.margin, this.color, this.customBorderRadius});
  final Widget childWidget;
  double? customHeight;
  double? customWidth;
  EdgeInsets? margin;
  Color? color;
  double? customBorderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      width: customWidth ?? AppConstants.screenWidth,
      height: customHeight,
      margin: margin ?? EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? AppColors.appPageColor,
        borderRadius: BorderRadius.circular( customBorderRadius ?? 15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Soft light reflection
            blurRadius: 6,
            offset: Offset(-2, -2), // Position of shadow (left, top)
          ),
        ],
      ),
      child: childWidget
    );
  }
}
