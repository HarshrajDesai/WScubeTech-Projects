import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/widgets/card_action_icon.dart';
import 'package:dairy_management/widgets/custom_card.dart';
import 'package:dairy_management/widgets/fix_sized_box.dart';
import 'package:dairy_management/widgets/status_indicator.dart';
import 'package:flutter/material.dart';

class PageDataCard extends StatelessWidget {
  const PageDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      customBorderRadius: 5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Heading',
                  style: AppTextStyles.poppinsSemiBold(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardActionIcon(
                      color: AppColors.selectedPageIconDecoration,
                      assetPath: 'assets/icons/flowbite_edit_outline.svg',
                    ),
                    CardActionIcon(
                      color: AppColors.statusDeActiveColor,
                      assetPath:
                          'assets/icons/material_symbols_delete_outline_rounded.svg',
                    ),
                  ],
                ),
              ),
            ],
          ),
          FixSizedBox(customHeight: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Dairy:', style: AppTextStyles.poppinsRegular()),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'HD\'s Dairy',
                  style: AppTextStyles.poppinsFieldText,
                ),
              ),
            ],
          ),
          FixSizedBox(customHeight: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Cattle:', style: AppTextStyles.poppinsRegular()),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Cow & Buffelo',
                  style: AppTextStyles.poppinsFieldText,
                ),
              ),
            ],
          ),
          FixSizedBox(customHeight: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StatusIndicator(
                color: AppColors.statusActiveColor,
                status: 'status',
              ),
              SizedBox(width: 10),
              StatusIndicator(
                color: AppColors.selectedPageIconDecoration,
                status: 'Details',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
