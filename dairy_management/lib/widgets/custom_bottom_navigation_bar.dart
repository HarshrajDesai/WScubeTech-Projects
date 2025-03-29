import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/providers/main_page_layout_provider.dart';
import 'package:dairy_management/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageLayoutProvider>(
      builder:
          (
            BuildContext context,
            MainPageLayoutProvider provider,
            Widget? child,
          ) => Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.appPageColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 10,
                  color: Colors.grey,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                provider.pageIndex == 0
                    ? Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.selectedPageIconDecoration.withOpacity(
                          0.2,
                        ),
                      ),
                      child: AppBarIcon(
                        assetPath:
                            'assets/icons/nav_bar_selected_icons/home_icon.svg',
                        onTapFunc: () {},
                      ),
                    )
                    : AppBarIcon(
                      assetPath:
                          'assets/icons/nav_bar_selected_icons/home_icon.svg',
                      customColor: Color(0xFF92949A),
                      onTapFunc: () {
                        int pageIndex = 0;
                        provider.updatePageIndex(pageIndex);
                      },
                    ),
                provider.pageIndex == 1
                    ? Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.selectedPageIconDecoration.withOpacity(
                          0.2,
                        ),
                      ),
                      child: AppBarIcon(
                        assetPath:
                            'assets/icons/nav_bar_selected_icons/transaction_icon.svg',
                        onTapFunc: () {},
                      ),
                    )
                    : AppBarIcon(
                      assetPath:
                          'assets/icons/nav_bar_selected_icons/transaction_icon.svg',
                      customColor: Color(0xFF92949A),
                      onTapFunc: () {
                        int pageIndex = 1;
                        provider.updatePageIndex(pageIndex);
                      },
                    ),
                provider.pageIndex == 2
                    ? Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.selectedPageIconDecoration.withOpacity(
                          0.2,
                        ),
                      ),
                      child: AppBarIcon(
                        assetPath:
                            'assets/icons/nav_bar_selected_icons/customer_icon.svg',
                        onTapFunc: () {},
                      ),
                    )
                    : AppBarIcon(
                      assetPath:
                          'assets/icons/nav_bar_selected_icons/customer_icon.svg',
                      customColor: Color(0xFF92949A),
                      onTapFunc: () {
                        int pageIndex = 2;
                        provider.updatePageIndex(pageIndex);
                      },
                    ),
                provider.pageIndex == 3
                    ? Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.selectedPageIconDecoration.withOpacity(
                          0.2,
                        ),
                      ),
                      child: AppBarIcon(
                        assetPath:
                            'assets/icons/nav_bar_selected_icons/bills_icon.svg',
                        onTapFunc: () {},
                      ),
                    )
                    : AppBarIcon(
                      assetPath:
                          'assets/icons/nav_bar_selected_icons/bills_icon.svg',
                      customColor: Color(0xFF92949A),
                      onTapFunc: () {
                        int pageIndex = 3;
                        provider.updatePageIndex(pageIndex);
                      },
                    ),
              ],
            ),
          ),
    );
  }
}
