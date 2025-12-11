import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/core/components/widgets/select_widget.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';

import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/components/widgets/custom_text.dart';
import '../../../../generated/app_assets.dart';
import 'add_credit_card_screen.dart';
import 'data/payment_cubit.dart';
import 'data/payment_model.dart';

class PaymentView extends StatelessWidget {
  final String totalAmount;

  const PaymentView({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Payment Method'), centerTitle: true),
        body: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PaymentError) {
              return Center(child: Text('Error: ${state.error}'));
            }

            return _buildContent(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, PaymentState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.w700S16('Select Payment Method'),
          const SizedBox(height: 20),

          // Credit Card Section
          _buildPaymentMethods(context, state),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods(BuildContext context, PaymentState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Credit Card Header
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomText.w600S14('Credit Card / Debit Card'),
        ),

        ...state.paymentMethods.map(
          (method) => Column(
            children: [
              SelectWidget(
                title: method.displayName,
                isSelect: method == state.selectedMethod,
                image: method.image,
              ),
              if (method.type == PaymentType.creditCard)
                Column(
                  children: [
                    Image.asset(AppAssets.wallet),
                    CustomButton(
                      title: 'Add New Credit Card',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      colorButton: AppColors.greyScaleColor10,
                      onPressed: () {
                        if (state.selectedMethod != null) {
                          showModalBottomSheet(context: context, builder: (context){
                            return AddCreditCardScreen();

                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a payment method'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
