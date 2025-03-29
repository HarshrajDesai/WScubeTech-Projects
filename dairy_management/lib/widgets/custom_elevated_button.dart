import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonLable,
    this.customTextColor,
    this.height,
    this.width,
    this.rectangleBorder,
    this.backgroundColor
  });
  final VoidCallback onPressed;
  final String buttonLable;
  Color? customTextColor;
  double? height;
  double? width;
  Color? backgroundColor;
  RoundedRectangleBorder? rectangleBorder; 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Color(0x00000000).withOpacity(0.30),
          backgroundColor: backgroundColor ?? Color(0xFF5F9DF9),
          shape: rectangleBorder ?? null 
        ),
        child: Text(
          buttonLable,
          style: AppTextStyles.poppinsButtonLable(customColor: customTextColor),
        ),
      ),
    );
  }
}
