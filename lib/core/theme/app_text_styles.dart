import 'package:flutter/widgets.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';

abstract class AppTextStyles {
  static const font36BoldWeight700 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static const font16BoldWeight700 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static const font20SemiBoldWeight600 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.greyScaleColor1,
  );
  static const font14MediumWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.greyScaleColor3,
  );
  static const font11GrayWeight400 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColor,
  );
  static const font14DarkGrayWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrayColor,
  );
  static const font14GrayWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grayColor,
  );
  static const font14BlackWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static const font14WhiteWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static const font11ErrorWeight400 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );
}
