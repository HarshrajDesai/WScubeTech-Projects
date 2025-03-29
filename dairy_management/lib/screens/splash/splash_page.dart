import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dairy_management/screens/login/login_page.dart';
import 'package:dairy_management/screens/main/main_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          duration: 1000,
          curve: Curves.easeInCubic,
          splash: Stack(
            children: [
              Image.asset(
                'assets/images/dairy_splash.png',
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/splash_icon.svg',
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
          nextScreen: LoginPage(),
          splashIconSize: double.infinity,
        ),
      ),
    );
  }
}





        // AnimatedSplashScreen(splash: LottieBuilder.asset('assets/lottie/Animation - 1741457868391.json'),
        //  nextScreen: HomePage(),
        //  splashIconSize: 400,)
                // Stack(
        //   children: [
        //     Image.asset('assets/images/dairy_splash.png',fit: BoxFit.cover,width: MediaQuery.sizeOf(context).width),
        //     Center(child: SvgPicture.asset('assets/icons/splash_icon.svg', height: 200,width: 200,)),
        //   ],
        // )