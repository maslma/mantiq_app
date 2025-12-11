import 'package:flutter/material.dart';
import 'package:mantiq_app/core/components/widgets/custom_text.dart';

import '../../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final bool enable;
  final bool loading;
  final VoidCallback onPressed;
  final Color? colorButton;
  final Color? titleColor;
  final bool isTextButton;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final EdgeInsets? edgeInsets;

  const CustomButton({
    super.key,
    this.icon,
    this.title,
    this.colorButton,
    this.titleColor,
    required this.onPressed,
    this.enable = true,
    this.loading = false,
    this.isTextButton = false,
    this.height,
    this.fontSize,
    this.borderRadius,
    this.fontWeight,
    this.edgeInsets,
  });

  // CopyWith method for modifying properties
  CustomButton copyWith({
    Widget? icon,
    String? title,
    bool? enable,
    bool? loading,
    VoidCallback? onPressed,
    Color? colorButton,
    Color? titleColor,
    bool? isTextButton,
    double? height,
    double? fontSize,
    FontWeight? fontWeight,
    BorderRadius? borderRadius,
  }) {
    return CustomButton(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      enable: enable ?? this.enable,
      loading: loading ?? this.loading,
      onPressed: onPressed ?? this.onPressed,
      colorButton: colorButton ?? this.colorButton,
      titleColor: titleColor ?? this.titleColor,
      isTextButton: isTextButton ?? this.isTextButton,
      height: height ?? this.height,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = colorButton ?? AppColors.primaryColor;

    return GestureDetector(
      onTap: enable && !loading ? onPressed : null,
      child: Container(
        height: height,
        padding: edgeInsets ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: enable ? buttonColor : Colors.grey.shade300,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: CustomText.w500S16(title).copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: fontWeight,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
