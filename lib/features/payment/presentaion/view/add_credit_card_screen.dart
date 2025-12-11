import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/core/components/widgets/app_text_field.dart';
import 'package:mantiq_app/core/components/widgets/custom_button.dart';
import 'package:mantiq_app/core/components/widgets/custom_text.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';
import 'package:mantiq_app/features/payment/presentaion/view/data/payment_model.dart';

import 'data/payment_cubit.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({super.key});

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  bool _saveAsDefault = false;

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText.w500S16(
                      'New Credit Card',
                    ).copyWith(fontSize: 18),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.greyScaleColor10,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Card Holder Name
                  AppTextField(
                    controller: _cardHolderNameController,
                    labelText: 'Card Holder Name',
                    hintText: 'Enter full name',
                    validator: _validateCardHolderName,
                    textInputAction: TextInputAction.next,
                    isRequired: true,
                  ),
                  const SizedBox(height: 20),

                  // Card Number
                  AppTextField(
                    controller: _cardNumberController,
                    labelText: 'Card Number',
                    hintText: '1234 5678 9101 1121',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardNumberInputFormatter(),
                    ],
                    validator: _validateCardNumber,
                    textInputAction: TextInputAction.next,
                    isRequired: true,
                    onChanged: (value) => setState(() {}),
                  ),
                  const SizedBox(height: 20),

                  // Expiry Date & CVV
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _expiryDateController,
                          labelText: 'Expiry Date',
                          hintText: 'MM/YY',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ExpiryDateInputFormatter(),
                          ],
                          validator: _validateExpiryDate,
                          textInputAction: TextInputAction.next,
                          isRequired: true,
                          onChanged: (value) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppTextField(
                          controller: _cvvController,
                          labelText: 'CVV',
                          hintText: '123',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          validator: _validateCVV,
                          textInputAction: TextInputAction.done,
                          isRequired: true,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Save as Default
                  // Replace with this:
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Save As A Default',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    value: _saveAsDefault,
                    onChanged: (value) {
                      setState(() => _saveAsDefault = value ?? false);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // Custom checkbox styling
                    checkboxShape: const CircleBorder(),
                    activeColor: AppColors.primaryColor,
                    checkColor: Colors.white,
                  ),
                  const SizedBox(height: 32),

                  // Add Credit Card Button
                  CustomButton(
                    title: 'Add Credit Card',
                    onPressed: _addCreditCard,
                    height: 56,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Validation Methods
  String? _validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card holder name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Only letters and spaces allowed';
    }
    return null;
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number is required';
    }
    final cleaned = value.replaceAll(' ', '');
    if (cleaned.length != 16) {
      return 'Card number must be 16 digits';
    }
    if (!RegExp(r'^\d+$').hasMatch(cleaned)) {
      return 'Only numbers allowed';
    }
    return null;
  }

  String? _validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiry date is required';
    }
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
      return 'Format: MM/YY';
    }

    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || year == null) {
      return 'Invalid date';
    }
    if (month < 1 || month > 12) {
      return 'Month must be 01-12';
    }

    final now = DateTime.now();
    final currentYear = now.year % 100;
    final currentMonth = now.month;

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Card has expired';
    }

    return null;
  }

  String? _validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required';
    }
    if (value.length != 3) {
      return 'CVV must be 3 digits';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Only numbers allowed';
    }
    return null;
  }

  void _addCreditCard() {
    if (_formKey.currentState!.validate()) {
      final cardInfo = CreditCardInfo(
        cardHolderName: _cardHolderNameController.text.trim(),
        cardNumber: _cardNumberController.text.replaceAll(' ', ''),
        expiryDate: _expiryDateController.text,
        securityCode: _cvvController.text,
        saveAsDefault: _saveAsDefault,
      );

      context.read<PaymentCubit>().addCreditCard(cardInfo);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Credit card added successfully'),
          backgroundColor: AppColors.successColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }
}

// Input formatters (same as before)
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' ');
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && text.length > 2) {
        buffer.write('/');
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
