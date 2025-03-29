
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardActionIcon extends StatelessWidget {
  const CardActionIcon({super.key, required this.color, required this.assetPath});
  final Color color;
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: color.withOpacity(0.3)
                ),
                child: SvgPicture.asset(assetPath, fit: BoxFit.scaleDown,color: color,),
              ),
            );
  }
}