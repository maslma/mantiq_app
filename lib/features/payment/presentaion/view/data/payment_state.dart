part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {
  final List<PaymentMethod> paymentMethods;
  final PaymentMethod? selectedMethod;
  final String walletBalance;
  final bool isLoading;

  const PaymentState({
    required this.paymentMethods,
    this.selectedMethod,
    required this.walletBalance,
    required this.isLoading,
  });

  PaymentState copyWith({
    List<PaymentMethod>? paymentMethods,
    PaymentMethod? selectedMethod,
    String? walletBalance,
    bool? isLoading,
  });
}

class PaymentInitial extends PaymentState {
  const PaymentInitial()
      : super(
    paymentMethods: const [],
    walletBalance: '350.00',
    isLoading: false,
  );

  @override
  PaymentInitial copyWith({
    List<PaymentMethod>? paymentMethods,
    PaymentMethod? selectedMethod,
    String? walletBalance,
    bool? isLoading,
  }) {
    return PaymentInitial();
  }
}

class PaymentLoaded extends PaymentState {
  const PaymentLoaded({
    required super.paymentMethods,
    super.selectedMethod,
    required super.walletBalance,
    super.isLoading = false,
  });

  @override
  PaymentLoaded copyWith({
    List<PaymentMethod>? paymentMethods,
    PaymentMethod? selectedMethod,
    String? walletBalance,
    bool? isLoading,
  }) {
    return PaymentLoaded(
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedMethod: selectedMethod ?? this.selectedMethod,
      walletBalance: walletBalance ?? this.walletBalance,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class PaymentLoading extends PaymentState {
  const PaymentLoading()
      : super(
    paymentMethods: const [],
    walletBalance: '0.00',
    isLoading: true,
  );

  @override
  PaymentLoading copyWith({
    List<PaymentMethod>? paymentMethods,
    PaymentMethod? selectedMethod,
    String? walletBalance,
    bool? isLoading,
  }) {
    return const PaymentLoading();
  }
}

class PaymentError extends PaymentState {
  final String error;

  const PaymentError(this.error)
      : super(
    paymentMethods: const [],
    walletBalance: '0.00',
    isLoading: false,
  );

  @override
  PaymentError copyWith({
    List<PaymentMethod>? paymentMethods,
    PaymentMethod? selectedMethod,
    String? walletBalance,
    bool? isLoading,
    String? error,
  }) {
    return PaymentError(error ?? this.error);
  }
}