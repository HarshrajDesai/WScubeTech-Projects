import 'package:dairy_management/screens/bills/customers_bills_page.dart';
import 'package:dairy_management/screens/customers/customers_page.dart';
import 'package:dairy_management/screens/main/main_page_layout.dart';
import 'package:dairy_management/screens/profile/dairy_owner_profile.dart';
import 'package:dairy_management/screens/rates/dairy_milk_rate_page.dart';
import 'package:dairy_management/screens/home/home_page.dart';
import 'package:dairy_management/screens/login/login_page.dart';
import 'package:dairy_management/screens/transactions/milk_transactions_page.dart';
import 'package:dairy_management/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String customer = '/customer';
  static const String addMilk = '/addMilk';
  static const String bill = '/bill';
  static const String rate = '/rate';
  static const String dairyOwnerProfile = '/profile';
  static const String mainPage = '/mainPage';

  static Map<String, WidgetBuilder> getRoutes(){
    return {
      splash:(context)=>SplashPage(),
      login:(context)=>LoginPage(),
      mainPage: (context) =>MainPageLayout(),
      // register:,
      home:(context)=>HomePage(),
      customer:(context)=>CustomersPage(),
      addMilk:(context)=>MilkTransactionsPage(),
      bill:(context)=>CustomersBillsPage(),
      rate:(context)=>DairyMilkRatePage(),
      dairyOwnerProfile: (context) => DairyOwnerProfile(),
    };
  }
}