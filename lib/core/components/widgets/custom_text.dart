import 'package:flutter/material.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? txt;
  final double fontSize;
  final double height;
  final int? maxLines;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final bool showCopyButton;
  final VoidCallback? onCopy;
  final BorderRadius? borderRadius;

  const CustomText({
    super.key,
    required this.txt,
    this.height = 1.3,
    this.maxLines,
    this.fontSize = 16,
    this.color,
    this.fontWeight = FontWeight.w400,
    this.textAlign,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    this.showCopyButton = false,
    this.onCopy,
    this.borderRadius,
  });

  /// CopyWith Method to Modify Text Dynamically
  CustomText copyWith({
    String? txt,
    double? fontSize,
    Color? color,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    bool? showCopyButton,
    VoidCallback? onCopy,
    int? maxLines,
    double? height,
    bool? useReadMore,
    int? readMoreMaxLines,
    String? readMoreExpandedText,
    String? readMoreCollapsedText,
    BorderRadius? borderRadius,
  }) {
    return CustomText(
      txt: txt ?? this.txt,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
      fontWeight: fontWeight ?? this.fontWeight,
      textAlign: textAlign ?? this.textAlign,
      showCopyButton: showCopyButton ?? this.showCopyButton,
      onCopy: onCopy ?? this.onCopy,
      maxLines: maxLines ?? this.maxLines,
      height: height ?? this.height,
      overflow: overflow ?? this.overflow,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  factory CustomText.w700S16(String? text, {Color? color}) => CustomText(
    txt: text,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: color,
  );

  factory CustomText.w700S20(String? text, {Color? color}) => CustomText(
    txt: text,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: color,
  );

  factory CustomText.w600S20(String? text) =>
      CustomText(txt: text, fontSize: 16, fontWeight: FontWeight.w600);

  factory CustomText.w500S16(String? text) =>
      CustomText(txt: text, fontSize: 16, fontWeight: FontWeight.w500);

  factory CustomText.w600S18(String? text) =>
      CustomText(txt: text, fontSize: 16, fontWeight: FontWeight.w500);

  factory CustomText.w700S14(String? text) =>
      CustomText(txt: text, fontSize: 14, fontWeight: FontWeight.bold);

  factory CustomText.w600S12(String? text, {Color? color}) => CustomText(
    txt: text,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: color,
  );

  factory CustomText.w500S14Grey(String? text) => CustomText(
    txt: text,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.greyScaleColor3,
  );

  factory CustomText.w700S12(String? text, {Color? color}) => CustomText(
    txt: text,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: color,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextColor =
        color ?? theme.textTheme.bodyLarge?.color ?? Colors.black;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            txt ?? '',
            style: TextStyle(
              fontSize: fontSize,
              color: defaultTextColor,
              fontWeight: fontWeight,
              height: height,
              decoration: textDecoration,
            ),
            maxLines: maxLines,
            overflow: overflow,
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
