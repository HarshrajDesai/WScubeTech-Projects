import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/widgets/fix_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortFilterInkwell extends StatelessWidget {
  const SortFilterInkwell({super.key, required this.assetPath, required this.lable, required this.onTapFunc});
  final String assetPath;
  final String lable;
  final GestureTapCallback onTapFunc;
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: InkWell(
              onTap: onTapFunc,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(assetPath, height: 30,width: 30,),
                  FixSizedBox(
                    customWidth: 5,
                  ),
                  Text(lable,style: AppTextStyles.poppinsFieldText,)
                ],
              ),
            ),
          );
  }
}