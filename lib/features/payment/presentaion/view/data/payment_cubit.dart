import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/features/payment/presentaion/view/data/payment_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial()) {
    _loadPaymentMethods();
  }

  void _loadPaymentMethods() {
    emit(PaymentLoading());

    // Simulate API call delay
    Future.delayed(const Duration(milliseconds: 500), () {
      final methods = [
        PaymentMethod(
          id: '1',
          type: PaymentType.creditCard,
          lastFourDigits: '1121',
          cardHolderName: 'John Doe',
          expiryDate: '02/30',
          isDefault: true,
          balance: '350.00',
        ),
        PaymentMethod(
          id: '2',
          type: PaymentType.paypal,
          email: 'john@example.com',
          balance: '350.00',
        ),
        PaymentMethod(
          id: '3',
          type: PaymentType.wallet,
          balance: '350.00',
        ),
      ];

      emit(PaymentLoaded(
        paymentMethods: methods,
        selectedMethod: methods.firstWhere((m) => m.isDefault),
        walletBalance: '350.00',
      ));
    });
  }

  void selectPaymentMethod(String methodId) {
    if (state is PaymentLoaded) {
      final currentState = state as PaymentLoaded;
      final method = currentState.paymentMethods.firstWhere(
            (m) => m.id == methodId,
        orElse: () => currentState.paymentMethods.first,
      );

      emit(currentState.copyWith(selectedMethod: method));
    }
  }

  void addCreditCard(CreditCardInfo cardInfo) {
    if (state is PaymentLoaded) {
      final currentState = state as PaymentLoaded;
      final newCard = PaymentMethod(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: PaymentType.creditCard,
        lastFourDigits: cardInfo.cardNumber.substring(cardInfo.cardNumber.length - 4),
        cardHolderName: cardInfo.cardHolderName,
        expiryDate: cardInfo.expiryDate,
        isDefault: cardInfo.saveAsDefault,
        balance: '350.00',
      );

      final updatedMethods = List<PaymentMethod>.from(currentState.paymentMethods)
        ..add(newCard);

      emit(currentState.copyWith(
        paymentMethods: updatedMethods,
        selectedMethod: cardInfo.saveAsDefault ? newCard : currentState.selectedMethod,
      ));
    }
  }

  void setAsDefault(String methodId) {
    if (state is PaymentLoaded) {
      final currentState = state as PaymentLoaded;
      final updatedMethods = currentState.paymentMethods.map((method) {
        return method.copyWith(isDefault: method.id == methodId);
      }).toList();

      final selectedMethod = updatedMethods.firstWhere((m) => m.id == methodId);

      emit(currentState.copyWith(
        paymentMethods: updatedMethods,
        selectedMethod: selectedMethod,
      ));
    }
  }

  void removePaymentMethod(String methodId) {
    if (state is PaymentLoaded) {
      final currentState = state as PaymentLoaded;
      final updatedMethods = currentState.paymentMethods
          .where((method) => method.id != methodId)
          .toList();

      PaymentMethod? newSelectedMethod = currentState.selectedMethod;
      if (currentState.selectedMethod?.id == methodId && updatedMethods.isNotEmpty) {
        newSelectedMethod = updatedMethods.first;
      }

      emit(currentState.copyWith(
        paymentMethods: updatedMethods,
        selectedMethod: updatedMethods.isNotEmpty ? newSelectedMethod : null,
      ));
    }
  }
}