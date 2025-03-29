import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/widgets/card_action_icon.dart';
import 'package:dairy_management/widgets/custom_card.dart';
import 'package:dairy_management/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BillCard extends StatelessWidget {
  const BillCard({super.key, required this.billStatus});
  final String billStatus;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.all(10),
      customBorderRadius: 10,
      childWidget: Column(
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Customer Name', style: AppTextStyles.poppinsSemiBold(fontWeight: FontWeight.w600),),
            CardActionIcon(color: AppColors.selectedPageIconDecoration, assetPath: 'assets/icons/uil_invoice.svg')
            
          ],
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pay', style: AppTextStyles.poppinsFieldText,),
            Text('2025-01-31 to 2025-02-15', style: AppTextStyles.poppinsRegular(),),
            Text('₹504.09', style: AppTextStyles.poppinsSemiBold(fontWeight: FontWeight.w600),)
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.statusActiveColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
            
                ),
                child: Text('Status',style: AppTextStyles.poppinsButtonLable(customColor: AppColors.statusActiveColor),),
              ),

            CustomElevatedButton( backgroundColor: Colors.blueAccent, customTextColor: AppColors.appPageColor ,onPressed: (){}, buttonLable: 'Pay',height: 40, width: 80,rectangleBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),)
          ],
        )
      ],
    ));
  }
}