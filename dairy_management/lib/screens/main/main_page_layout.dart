import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/providers/main_page_layout_provider.dart';
import 'package:dairy_management/widgets/custom_app_bar.dart';
import 'package:dairy_management/widgets/custom_bottom_navigation_bar.dart';
import 'package:dairy_management/widgets/custom_elevated_button.dart';
import 'package:dairy_management/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainPageLayout extends StatelessWidget {
  const MainPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: 'assets/icons/back_icons.svg',
        title: 'DashBoard',
        isDashboardPage: true,
      ),
      body: Stack(
        children: [
          Consumer<MainPageLayoutProvider>(
            builder: (context, provider, child) {
              // print('buyild');
              return provider.getRequiredPage(provider.pageIndex);
            },
          ),
        ],
      ),

      floatingActionButton: Consumer<MainPageLayoutProvider>(
        builder:
            (context, provider, child) =>
                provider.pageIndex == 2
                    ? FloatingActionButton.extended(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/nav_bar_selected_icons/customer_icon.svg',
                      ),
                      label: Text(
                        'Add Customer',
                        style: AppTextStyles.poppinsButtonLable(
                          customColor: AppColors.mainHeadingsColor,
                        ),
                      ),
                    )
                    : provider.pageIndex == 1
                    ? FloatingActionButton.extended(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onPressed: () {
                        _showOverlay(context);
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/nav_bar_selected_icons/transaction_icon.svg',
                      ),
                      label: Text(
                        'Add Milk',
                        style: AppTextStyles.poppinsButtonLable(
                          customColor: AppColors.mainHeadingsColor,
                        ),
                      ),
                    )
                    : provider.pageIndex == 3
                    ? FloatingActionButton.extended(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/nav_bar_selected_icons/bills_icon.svg',
                      ),
                      label: Text(
                        'Bills',
                        style: AppTextStyles.poppinsButtonLable(
                          customColor: AppColors.mainHeadingsColor,
                        ),
                      ),
                    )
                    : FloatingActionButton(onPressed: () {}),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  void _showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    OverlayEntry? overlayEntry;
    int selectedOption = 1;

    overlayEntry = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    overlayEntry!.remove();
                    overlayEntry = null;
                  },
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),
              ),
              Center(
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      // width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.overlayColor,
                      ),
                      // height: 200,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomTextField(
                                  borderRadius: BorderRadius.circular(10),
                                  fieldName: "Customer Name",
                                  prefixIcon: null,
                                  textEditingController: null,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomTextField(
                                  borderRadius: BorderRadius.circular(10),
                                  fieldName: "Customer Name",
                                  prefixIcon: null,
                                  textEditingController: null,
                                  customColor: AppColors.overlayColor,
                                ),
                              ),
                            ],
                          ),
                          CustomTextField(fieldName: 'yyyy-xx-xx', prefixIcon: null, textEditingController: null, borderRadius: BorderRadius.circular(10),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(value: 1, groupValue: selectedOption, onChanged: (value){} ),
                              Text('Morning'),
                              SizedBox(
                                width: 10,
                              ),
                              Radio(value: 2, groupValue: selectedOption, onChanged: (value){}),
                              Text('Evening')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomElevatedButton(width: 150,onPressed: (){}, buttonLable: 'Search', rectangleBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),),
                              CustomElevatedButton(backgroundColor: Color(0xFFF5F9FE),width: 100,onPressed: (){}, buttonLable: 'Close', rectangleBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
    );

    overlay.insert(overlayEntry!);
  }
}
