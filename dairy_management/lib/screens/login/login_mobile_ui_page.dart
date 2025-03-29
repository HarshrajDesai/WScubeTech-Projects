import 'package:dairy_management/providers/login_page_provider.dart';
import 'package:dairy_management/routes/app_routes.dart';
import 'package:dairy_management/widgets/auth_pages_inkwell.dart';
import 'package:dairy_management/widgets/custom_elevated_button.dart';
import 'package:dairy_management/widgets/custom_text_field.dart';
import 'package:dairy_management/widgets/fix_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginMobileUiPage extends StatelessWidget {
  const LoginMobileUiPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
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
                            AspectRatio(
                              aspectRatio: 16/9,
                              child: Image.asset('assets/images/login_page_illustartion.jpg')),
                            CustomTextField(
                              fieldName: 'Username',
                              prefixIcon: Icons.person,
                              textEditingController: value.userNameController,
                            ),
                            FixSizedBox(),
                            CustomTextField(
                              obscureText: true,
                              fieldName: 'Password',
                              prefixIcon: Icons.lock,
                              textEditingController: value.passwordController,
                            ),
                            FixSizedBox(customHeight: 40,),
                            CustomElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.mainPage);
                              },
                              buttonLable: 'Login',
                              customTextColor: Color(0xFFFFFFFF),
                            ),
                            FixSizedBox(),
                            AuthPagesInkwell(onTapOfInkwell: () { 
                              Navigator.pushNamed(context, AppRoutes.register);
                             }, hintText: 'Don\'t have an account?', clickable: 'Register',),
                          ],
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
