import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle poppinsBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 25
  ); 

  static TextStyle poppinsSemiBold({FontWeight? fontWeight}) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: fontWeight?? FontWeight.w500,
    fontSize: 20
  );

  static TextStyle poppinsRegular({Color? customColor}) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: customColor ?? AppColors.mainHeadingsColor
  );

  static const TextStyle poppinsFieldText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16
  );
  
  static const TextStyle poppinsTableDataFields = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16
  );
  
  static TextStyle poppinsButtonLable({Color? customColor}) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: customColor ?? AppColors.mainHeadingsColor
  );
}