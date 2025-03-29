import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({super.key, required this.color, required this.status});
  final Color color;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {},
        child: Text(
          status,
          style: AppTextStyles.poppinsButtonLable(customColor: color),
        ),
      ),
    );
  }
}
