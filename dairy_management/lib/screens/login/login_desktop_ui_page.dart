import 'package:dairy_management/providers/login_page_provider.dart';
import 'package:dairy_management/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginDesktopUiPage extends StatelessWidget {
  const LoginDesktopUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: Container(
              height: 400,
              width: 400,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      'assets/images/login_back.svg',
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
              
                  Center(
                    child: Consumer<LoginPageProvider>(
                      builder:
                          (context, value, child) => Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  fieldName: 'Username',
                                  prefixIcon: Icons.person,
                                  textEditingController: value.userNameController,
                                ),
                                SizedBox(height: 20),
                                CustomTextField(
                                  obscureText: true,
                                  fieldName: 'Password',
                                  prefixIcon: Icons.lock,
                                  textEditingController: value.passwordController,
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}