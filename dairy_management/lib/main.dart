import 'package:dairy_management/core/theme/app_constants.dart';
import 'package:dairy_management/providers/home_page_provider.dart';
import 'package:dairy_management/providers/login_page_provider.dart';
import 'package:dairy_management/providers/main_page_layout_provider.dart';
import 'package:dairy_management/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LoginPageProvider()),
        ChangeNotifierProvider(create: (context)=>HomePageProvider()),
        ChangeNotifierProvider(create: (context)=>MainPageLayoutProvider()),
      ],
      child: Builder(
        builder: (context) {
          AppConstants.init(context);
          return MaterialApp(
            title: AppConstants.appName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF5F9DF9)),
            ),
            initialRoute: AppRoutes.splash,
            routes: AppRoutes.getRoutes(),
            debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}
