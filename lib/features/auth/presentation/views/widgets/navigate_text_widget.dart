import 'package:flutter/material.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/theme/app_text_styles.dart';

import '../../../../../generated/app_assets.dart';

class NavigateTextWidget extends StatelessWidget {
  const NavigateTextWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: AppTextStyles.font14BlackWeight500),
          3.horizontalSizedBox,
          // Image.asset(AppAssets.imagesArrow, width: 40, height: 25),
        ],
      ),
    );
  }
}
