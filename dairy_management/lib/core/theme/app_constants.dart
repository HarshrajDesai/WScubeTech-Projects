import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = "HD'S Dairy";
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context){
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
  }
  
}