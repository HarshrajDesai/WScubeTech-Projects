import 'package:dairy_management/core/theme/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class PieChartIndexFields extends StatelessWidget {
  const PieChartIndexFields({
    super.key,
    required this.fieldColor,
    required this.fieldText,
  });

  final Color fieldColor;
  final String fieldText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 20,
          decoration: BoxDecoration(
            color: fieldColor, // FIXED: Color applied inside BoxDecoration
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        SizedBox(width: 8), // Added spacing
        Expanded(
          child: Text(
            fieldText,
            style: AppTextStyles.poppinsFieldText,
            // overflow: TextOverflow.ellipsis, // Prevents text overflow
            // maxLines: 1,
          ),
        ),
      ],
    );
  }
}
