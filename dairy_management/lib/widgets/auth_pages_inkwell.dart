import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthPagesInkwell extends StatelessWidget {
  const AuthPagesInkwell({super.key, required this.onTapOfInkwell, required this.hintText, required this.clickable});
  final GestureTapCallback onTapOfInkwell;
  final String hintText;
  final String clickable;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(hintText, style: AppTextStyles.poppinsRegular(),),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: onTapOfInkwell,
              child: Text(clickable, style: AppTextStyles.poppinsButtonLable(),),
            ),
          ],
        ),
      ],
    );
  }
}