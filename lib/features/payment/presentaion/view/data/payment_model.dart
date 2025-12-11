import 'package:equatable/equatable.dart';

import '../../../../../generated/app_assets.dart';

enum PaymentType { creditCard, paypal, wallet }

class PaymentMethod extends Equatable {
  final String id;
  final PaymentType type;
  final String? lastFourDigits;
  final String? cardHolderName;
  final String? expiryDate;
  final String? email;
  final bool isDefault;
  final String balance;

  const PaymentMethod({
    required this.id,
    required this.type,
    this.lastFourDigits,
    this.cardHolderName,
    this.expiryDate,
    this.email,
    this.isDefault = false,
    required this.balance,
  });

  PaymentMethod copyWith({
    String? id,
    PaymentType? type,
    String? lastFourDigits,
    String? cardHolderName,
    String? expiryDate,
    String? email,
    bool? isDefault,
    String? balance,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      type: type ?? this.type,
      lastFourDigits: lastFourDigits ?? this.lastFourDigits,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      email: email ?? this.email,
      isDefault: isDefault ?? this.isDefault,
      balance: balance ?? this.balance,
    );
  }

  String get displayName {
    switch (type) {
      case PaymentType.creditCard:
        return 'Credit Card / Debit Card';
      case PaymentType.paypal:
        return 'Paypal';
      case PaymentType.wallet:
        return 'My Wallet';
    }
  }

  String get displayNumber {
    switch (type) {
      case PaymentType.creditCard:
        return '**** **** **** $lastFourDigits';
      case PaymentType.paypal:
        return email ?? '';
      case PaymentType.wallet:
        return 'Balance: \$$balance';
    }
  }

  String get image {
    switch (type) {
      case PaymentType.creditCard:
        return AppAssets.payWithCard;
      case PaymentType.paypal:
        return AppAssets.payWithPaypal;
      case PaymentType.wallet:
        return AppAssets.wallet;
    }
  }

  @override
  List<Object?> get props => [
    id,
    type,
    lastFourDigits,
    cardHolderName,
    expiryDate,
    email,
    isDefault,
    balance,
  ];
}

class CreditCardInfo {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String securityCode;
  final bool saveAsDefault;

  const CreditCardInfo({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
    this.saveAsDefault = false,
  });
}
