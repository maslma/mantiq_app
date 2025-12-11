import 'package:flutter/material.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';
import 'package:mantiq_app/core/theme/app_text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: 16.vPadding,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: 8.allBorderRadius,
        ),
        child: Text(title, style: AppTextStyles.font16BoldWeight700).center(),
      ),
    );
  }
}
