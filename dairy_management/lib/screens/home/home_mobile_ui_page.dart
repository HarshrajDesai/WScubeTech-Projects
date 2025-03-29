import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_constants.dart';
import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/providers/home_page_provider.dart';
import 'package:dairy_management/widgets/custom_card.dart';
import 'package:dairy_management/widgets/dashboard_pie_chart.dart';
import 'package:dairy_management/widgets/fix_sized_box.dart';
import 'package:dairy_management/widgets/pie_chart_index_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeMobileUiPage extends StatelessWidget {
  const HomeMobileUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Consumer<HomePageProvider>(
          builder:
              (
                BuildContext context,
                HomePageProvider value,
                Widget? child,
              ) => Container(
                padding: EdgeInsets.all(10),
                // height: AppConstants.screenHeight,
                width: AppConstants.screenWidth,
                color: AppColors.appPageColor,
                child: Column(
                  children: [
                    CustomCard(
                      childWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: DashboardPieChart(
                              colorSectionOne:
                                  AppColors.pieChartBuffaloSectionColor,
                              colorSectionTwo:
                                  AppColors.pieChartCowSectionColor,
                              pieChartSectionDataRadius: 25,
                              pieChartCenterSpaceRadius: 55,
                              pieChartHeading: 'Today\'s Milk',
                              pieChartTotalQty: '600ltr',
                              sectionOneValue: 450,
                              sectionTwoValue: 150,
                              cenerIconAssetPath: 'assets/icons/milk_qty.svg',
                            ),
                          ),
                          FixSizedBox(customWidth: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PieChartIndexFields(
                                  fieldColor:
                                      AppColors.pieChartBuffaloSectionColor,
                                  fieldText: '300ltr Buffalo Milk',
                                ),
                                FixSizedBox(customHeight: 20),
                                PieChartIndexFields(
                                  fieldColor: AppColors.pieChartCowSectionColor,
                                  fieldText: '300ltr Cow Milk',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FixSizedBox(customHeight: 10),
                    CustomCard(
                      childWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: DashboardPieChart(
                              colorSectionOne:
                                  AppColors.pieChartBuffaloSectionColor,
                              colorSectionTwo:
                                  AppColors.pieChartCowSectionColor,
                              pieChartSectionDataRadius: 25,
                              pieChartCenterSpaceRadius: 55,
                              pieChartHeading: 'Total Dairy Milk',
                              sectionOneValue: 10000,
                              sectionTwoValue: 350,
                              cenerIconAssetPath: 'assets/icons/milk_qty.svg',
                            ),
                          ),
                          FixSizedBox(customWidth: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PieChartIndexFields(
                                  fieldColor:
                                      AppColors.pieChartBuffaloSectionColor,
                                  fieldText: 'Todays Milk Transactions',
                                ),
                                FixSizedBox(customHeight: 20),
                                PieChartIndexFields(
                                  fieldColor: AppColors.pieChartCowSectionColor,
                                  fieldText: 'Total Milk Transactions',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FixSizedBox(customHeight: 10),
                    CustomCard(
                      customHeight: 160,
                      childWidget: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Milk prices",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                DropdownButton<String>(
                                  value: "All Time",
                                  items:
                                      ["All Time", "Last Month", "Last Week"]
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                  onChanged: (val) {},
                                ),
                              ],
                            ),
                            FixSizedBox(customHeight: 5),
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.milkPrices.length,
                                itemBuilder:
                                    (context, index) => Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      padding: EdgeInsets.all(5),
                                      width: 220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.appPageColor,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            color: Colors.grey,
                                            blurRadius: 5,
                                          ),
                                          BoxShadow(
                                            offset: Offset(-1, -1),
                                            color: Colors.grey,
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${value.milkPrices[index]['milk_price']}.00',
                                            style: AppTextStyles.poppinsBold,
                                          ),
                                          Text(
                                            'Rs/Ltr',
                                            style:
                                                AppTextStyles
                                                    .poppinsTableDataFields,
                                          ),
                                          FixSizedBox(customWidth: 10),
                                          Expanded(
                                            child: Text(
                                              value
                                                  .milkPrices[index]['milk_type'],
                                              style:
                                                  AppTextStyles.poppinsSemiBold(),
                                            ),
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
                    FixSizedBox(customHeight: 10),
                    CustomCard(
                      // customHeight: 400,
                      childWidget: Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        children: [
                          CustomCard(
                            customHeight: 100,
                            customWidth: AppConstants.screenWidth / 2.25,
                            childWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DashboardPieChart(
                                  colorSectionOne:
                                      AppColors.pieChartCowSectionColor,
                                  colorSectionTwo: AppColors.overlayColor,
                                  pieChartSectionDataRadius: 15,
                                  pieChartCenterSpaceRadius: 30,
                                  sectionOneValue: 1000,
                                  sectionTwoValue: 0,
                                  cenerIconAssetPath: 'assets/icons/customer_icon.svg',
                                ),
                                FixSizedBox(customWidth: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Dairy Customers',
                                          style:
                                              AppTextStyles
                                                  .poppinsTableDataFields,
                                        ),
                                      ),
                                      Text(
                                        '1000',
                                        style: AppTextStyles.poppinsFieldText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomCard(
                            customHeight: 100,
                            customWidth: AppConstants.screenWidth / 2.25,
                            childWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DashboardPieChart(
                                  colorSectionOne:
                                      AppColors.pieChartCowSectionColor,
                                  colorSectionTwo: AppColors.overlayColor,
                                  pieChartSectionDataRadius: 15,
                                  pieChartCenterSpaceRadius: 30,
                                  sectionOneValue: 1000,
                                  sectionTwoValue: 0,
                                  cenerIconAssetPath:
                                      'assets/icons/customer_icon.svg',
                                ),
                                FixSizedBox(customWidth: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Active Customers',
                                          style:
                                              AppTextStyles
                                                  .poppinsTableDataFields,
                                        ),
                                      ),
                                      Text(
                                        '1000',
                                        style: AppTextStyles.poppinsFieldText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomCard(
                            customHeight: 100,
                            customWidth: AppConstants.screenWidth / 2.25,
                            childWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DashboardPieChart(
                                  colorSectionOne:
                                      AppColors.pieChartCowSectionColor,
                                  colorSectionTwo: AppColors.overlayColor,
                                  pieChartSectionDataRadius: 15,
                                  pieChartCenterSpaceRadius: 30,
                                  sectionOneValue: 1000,
                                  sectionTwoValue: 0,
                                  cenerIconAssetPath: 'assets/icons/customer_icon.svg',
                                ),
                                FixSizedBox(customWidth: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'New Customers',
                                          style:
                                              AppTextStyles
                                                  .poppinsTableDataFields,
                                        ),
                                      ),
                                      Text(
                                        '1000',
                                        style: AppTextStyles.poppinsFieldText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomCard(
                            customHeight: 100,
                            customWidth: AppConstants.screenWidth / 2.25,
                            childWidget: Row(
                              children: [
                                DashboardPieChart(
                                  colorSectionOne:
                                      AppColors.pieChartBuffaloSectionColor,
                                  colorSectionTwo: AppColors.overlayColor,
                                  pieChartSectionDataRadius: 15,
                                  pieChartCenterSpaceRadius: 30,
                                  sectionOneValue: 700,
                                  sectionTwoValue: 300,
                                  cenerIconAssetPath: 'assets/icons/customer_icon.svg',
                                ),
                                FixSizedBox(customWidth: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Inactive Customers',
                                          style:
                                              AppTextStyles
                                                  .poppinsTableDataFields,
                                        ),
                                      ),
                                      Text(
                                        '1000',
                                        style: AppTextStyles.poppinsFieldText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ),
    );
  }
}
