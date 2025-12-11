import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'custom_text.dart';

class SelectWidget extends StatelessWidget {
  const SelectWidget({super.key, required this.title, required this.isSelect});

  final String title;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.greyScaleColor7),
      ),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: CustomText.w500S14Grey(title)),
          SizedBox(width: 8),
          selectWidget(isSelect),
        ],
      ),
    );
  }

  Widget selectWidget(bool isSelect) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelect ? AppColors.primaryColor : Colors.transparent,
        border: Border.all(
          color: isSelect ? AppColors.primaryColor : AppColors.greyScaleColor7,
        ),
      ),
      child: Stack(
        children: [
          if (isSelect)
            Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
