import 'package:flutter/material.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';
import 'package:text_gradiate/text_gradiate.dart';

class TextGradiateWidget extends StatelessWidget {
  const TextGradiateWidget({
    super.key,
    required this.fontSize,
    required this.text,
    required this.fontWeight,
  });

  final double fontSize;
  final String text;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextGradiate(
      text: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
      colors: [AppColors.gradiantTextColor1, AppColors.gradiantTextColor2],
      gradientType: GradientType.linear,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      tileMode: TileMode.clamp,
    );
  }
}
