import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';
import 'package:mantiq_app/core/theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.labelText,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.onSubmitted,
    this.onFocusChange,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.autofocus = false,
    this.readOnly = false,
    this.focusNode,
    this.contentPadding,
    this.filled = true,
    this.fillColor = AppColors.whiteColor,
    this.borderRadius,
    this.isRequired = false,
    this.showValidationIcons = true,
    this.errorText,
    this.onTap,
    this.autocorrect = true,
    this.enableSuggestions = true,
  });

  final String hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(bool)? onFocusChange;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final bool readOnly;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final bool filled;
  final Color fillColor;
  final BorderRadius? borderRadius;
  final bool isRequired;
  final bool showValidationIcons;
  final String? errorText;
  final VoidCallback? onTap;
  final bool autocorrect;
  final bool enableSuggestions;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  String? _errorText;
  bool _isValid = false;
  bool _isDirty = false;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
    widget.onFocusChange?.call(_hasFocus);

    // Validate on focus loss if dirty
    if (!_hasFocus && _isDirty && widget.controller != null) {
      _validate(widget.controller!.text);
    }
  }

  void _validate(String value) {
    if (!_isDirty) {
      setState(() => _isDirty = true);
    }

    if (widget.validator != null) {
      final error = widget.validator!(value);
      setState(() {
        _errorText = error;
        _isValid = error == null && value.isNotEmpty;
      });
    }
    widget.onChanged?.call(value);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Widget? _buildSuffixIcon() {
    // Show password toggle for password fields
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _showPassword ? Icons.visibility_off : Icons.visibility,
          color: AppColors.grayColor,
        ),
        onPressed: _togglePasswordVisibility,
      );
    }

    // Show validation icons if enabled
    if (widget.showValidationIcons && _isDirty) {
      if (_errorText != null && _errorText!.isNotEmpty) {
        return Icon(Icons.error_outline, color: AppColors.errorColor, size: 20);
      } else if (_isValid) {
        return Icon(
          Icons.check_circle,
          color: AppColors.successColor,
          size: 20,
        );
      }
    }

    // Use custom suffix icon if provided
    return widget.suffixIcon;
  }

  InputDecoration _buildDecoration(BuildContext context) {
    final bool showError =
        _errorText != null && _errorText!.isNotEmpty && _isDirty;
    final Color borderColor = showError
        ? AppColors.errorColor
        : _hasFocus
        ? (_isValid ? AppColors.successColor : AppColors.primaryColor)
        : AppColors.grayColor;

    final double borderWidth = _hasFocus || showError ? 1.5 : 1.0;

    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: AppTextStyles.font14GrayWeight500,
      labelText: widget.labelText,
      labelStyle: AppTextStyles.font14DarkGrayWeight500,
      floatingLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

      // Label with required indicator
      prefixText: widget.isRequired ? '* ' : null,
      prefixStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

      prefixIcon: widget.prefixIcon,
      suffixIcon: _buildSuffixIcon(),

      fillColor: widget.fillColor,
      filled: widget.filled && widget.enabled,

      contentPadding:
          widget.contentPadding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: widget.borderRadius ?? 8.allBorderRadius,
        borderSide: BorderSide(color: AppColors.grayColor, width: 1.0),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: widget.borderRadius ?? 8.allBorderRadius,
        borderSide: BorderSide(color: AppColors.grayColor, width: 1.0),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: widget.borderRadius ?? 8.allBorderRadius,
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: widget.borderRadius ?? 8.allBorderRadius,
        borderSide: BorderSide(
          color: AppColors.grayColor.withOpacity(0.3),
          width: 1.0,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: widget.borderRadius ?? 8.allBorderRadius,
        borderSide: BorderSide(color: AppColors.errorColor, width: borderWidth),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: widget.borderRadius ?? 8.allBorderRadius,
        borderSide: BorderSide(color: AppColors.errorColor, width: borderWidth),
      ),

      errorText: showError ? (_errorText ?? widget.errorText) : null,
      errorStyle: AppTextStyles.font11ErrorWeight400,
      errorMaxLines: 2,

      counterText: widget.maxLength != null ? null : '',
      counterStyle: TextStyle(
        fontSize: 12,
        color: AppColors.greyScaleColor7,
        fontWeight: FontWeight.w400,
      ),

      enabled: widget.enabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          RichText(
            text: TextSpan(
              text: widget.labelText,
              style: AppTextStyles.font14DarkGrayWeight500,
              children: [
                if (widget.isRequired)
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],

        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          cursorColor: AppColors.primaryColor,
          style: AppTextStyles.font14DarkGrayWeight500.copyWith(
            color: widget.enabled ? AppColors.blackColor : AppColors.grayColor,
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText && !_showPassword,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          onChanged: _validate,
          onFieldSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          validator: (value) {
            final error = widget.validator?.call(value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _errorText = error;
                _isValid = error == null && (value?.isNotEmpty ?? false);
              });
            });
            return error;
          },
          decoration: _buildDecoration(context),
        ),
      ],
    );
  }
}
