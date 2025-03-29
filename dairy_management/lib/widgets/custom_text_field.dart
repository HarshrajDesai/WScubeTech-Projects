import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.fieldName,
    required this.prefixIcon,
    required this.textEditingController,
    this.obscureText = false,
    this.borderRadius,
    this.customColor
  });
  final String fieldName;
  final IconData? prefixIcon;
  final TextEditingController? textEditingController;
  BorderRadius? borderRadius;
  bool obscureText;
  Color? customColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.25),
      color: Colors.transparent,
      child: TextField(
        obscureText: obscureText,
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: customColor ?? Color(0xFFFFFFFF),
          labelText: fieldName,
          labelStyle: AppTextStyles.poppinsRegular(),
          // prefixIcon: Icon(prefixIcon, size: 20),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.2),
              width: 2.0,
            ),
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.6),
              width: 2.0,
            ),
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
