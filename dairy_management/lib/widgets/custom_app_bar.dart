import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:dairy_management/widgets/app_bar_icon.dart';
import 'package:dairy_management/widgets/custom_profile_avatar.dart';
import 'package:dairy_management/widgets/fix_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  CustomAppBar({super.key,this.isDashboardPage = false, this.leadingIcon, required this.title});
  String? leadingIcon;
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isDashboardPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.appBarColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, 1),
            blurRadius: 10
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDashboardPage? CustomProfileAvatar(assetPath: 'assets/images/profile_image.png') :AppBarIcon(assetPath: leadingIcon!, onTapFunc: (){
                // scaffoldKey.currentState?.openDrawer();
              },),
              isDashboardPage ? Row(
                children: [
                  SvgPicture.asset('assets/icons/title_icons.svg', height: 20,width: 20,color: AppColors.mainHeadingsColor,),
                  FixSizedBox(
                    customWidth: 5,
                  ),
                  Text('HD\'s Dairy',style: AppTextStyles.poppinsBold,)
                ],
              ) : Text(title, style: AppTextStyles.poppinsBold,),
              AppBarIcon(assetPath: 'assets/icons/menu_icons.svg', onTapFunc: (){},)
            ],
          ),
                  ],
      ),
    
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}