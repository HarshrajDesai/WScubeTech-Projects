import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/widgets/fix_sized_box.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardPieChart extends StatelessWidget {
  DashboardPieChart({super.key, required this.colorSectionOne, required this.colorSectionTwo, this.pieChartTotalQty = '', this.pieChartHeading = '', required this.pieChartSectionDataRadius, required this.pieChartCenterSpaceRadius, required this.sectionOneValue, required this.sectionTwoValue, required this.cenerIconAssetPath});
  final Color colorSectionOne;
  final Color colorSectionTwo;
  String pieChartTotalQty;
  String pieChartHeading;
  final double pieChartSectionDataRadius;
  final double pieChartCenterSpaceRadius;
  final double sectionOneValue;
  final double sectionTwoValue;
  final String cenerIconAssetPath;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [ 
          Center(
            child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: sectionOneValue,
                  color: colorSectionOne,
                  radius: pieChartSectionDataRadius,
                  showTitle: false
                ),
                PieChartSectionData(
                  value: sectionTwoValue,
                  color: colorSectionTwo,
                  radius: pieChartSectionDataRadius,
                  showTitle: false
                ),
              ],
              centerSpaceRadius: pieChartCenterSpaceRadius
            )
                    ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(cenerIconAssetPath,height: 25,width: 25,),
                FixSizedBox(
                  customHeight: 5,
                ),
                if(pieChartTotalQty != '') Text(pieChartTotalQty,style: AppTextStyles.poppinsFieldText,),
                FixSizedBox(
                  customHeight: 5,
                ),
                if(pieChartHeading != '') Text(pieChartHeading,  overflow: TextOverflow.clip,style: AppTextStyles.poppinsRegular(customColor: Color(0xFF5E5E5E)),),
              ],
            ),
          )
      ]),
    );
  }
}