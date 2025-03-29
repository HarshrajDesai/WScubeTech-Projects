import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/widgets/card_action_icon.dart';
import 'package:dairy_management/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class MilkTransactionCard extends StatelessWidget {
  const MilkTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      customBorderRadius: 8,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Customer Name', style: AppTextStyles.poppinsSemiBold(fontWeight: FontWeight.w600),),
            Text('2025-03-04', style: AppTextStyles.poppinsRegular(),),
            CardActionIcon(color: AppColors.selectedPageIconDecoration, assetPath: 'assets/icons/uil_invoice.svg',),
          ],
        ),
        Text('Cow milk', style: AppTextStyles.poppinsRegular(),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Morning', style: AppTextStyles.poppinsRegular(),),
            Text('7 ltr', style: AppTextStyles.poppinsTableDataFields,),
            Text('180 Rs', style: AppTextStyles.poppinsFieldText,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Morning', style: AppTextStyles.poppinsRegular(),),
            Text('7 ltr', style: AppTextStyles.poppinsTableDataFields,),
            Text('180 Rs', style: AppTextStyles.poppinsFieldText,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.statusActiveColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
            
                ),
                child: InkWell(
                  onTap: (){},
                  child: Text('Status',style: AppTextStyles.poppinsButtonLable(customColor: AppColors.statusActiveColor),),
                ),
              ),
            Text('360 Rs',style: AppTextStyles.poppinsFieldText,)
          ],
        )
      ],
    ));
  }
}