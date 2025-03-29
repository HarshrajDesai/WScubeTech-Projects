import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/widgets/sort_filter_inkwell.dart';
import 'package:flutter/material.dart';

class SortAndFilterBar extends StatelessWidget {
  const SortAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.appPageColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.grey,
            blurRadius: 5
          )
        ]
      ),
      height: 50,
      child:Row(
        children:[
          SortFilterInkwell(assetPath: 'assets/icons/sort_icon.svg', lable: 'Sort', onTapFunc: (){}),
          VerticalDivider(
            thickness: 2,
            width: 2,
          ),
          SortFilterInkwell(assetPath: 'assets/icons/filter_icon.svg', lable: 'Filter', onTapFunc: (){}),
        ]
      )
    );
  }
}