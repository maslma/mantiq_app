import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/custom_text.dart';
import '../data/payment_model.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onSetDefault;
  final VoidCallback? onRemove;

  const PaymentMethodItem({
    super.key,
    required this.paymentMethod,
    required this.isSelected,
    required this.onTap,
    this.onSetDefault,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: isSelected ? Colors.blue.shade50 : Colors.white,
      child: ListTile(
        leading: _buildIcon(paymentMethod.type),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.w600S14(paymentMethod.displayName),
                if (paymentMethod.isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Default',
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            CustomText.w400S12(paymentMethod.displayNumber),
            if (paymentMethod.type == PaymentType.creditCard)
              CustomText.w400S12('Expires ${paymentMethod.expiryDate}'),
          ],
        ),
        trailing: _buildTrailing(context),
        onTap: onTap,
      ),
    );
  }

  Widget _buildIcon(PaymentType type) {
    switch (type) {
      case PaymentType.creditCard:
        return const Icon(Icons.credit_card, color: Colors.blue, size: 32);
      case PaymentType.paypal:
        return Image.asset(
          'assets/paypal.png',
          width: 32,
          height: 32,
          color: Colors.blue,
        );
      case PaymentType.wallet:
        return const Icon(
          Icons.account_balance_wallet,
          color: Colors.green,
          size: 32,
        );
    }
  }

  Widget _buildTrailing(BuildContext context) {
    if (paymentMethod.type == PaymentType.creditCard) {
      return PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'set_default',
            child: Text('Set as Default'),
          ),
          const PopupMenuItem(
            value: 'remove',
            child: Text('Remove Card', style: TextStyle(color: Colors.red)),
          ),
        ],
        onSelected: (value) {
          if (value == 'set_default' && onSetDefault != null) {
            onSetDefault!();
          } else if (value == 'remove' && onRemove != null) {
            _showRemoveDialog(context);
          }
        },
      );
    }

    return const Icon(Icons.radio_button_checked, color: Colors.blue);
  }

  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Card'),
        content: const Text('Are you sure you want to remove this card?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (onRemove != null) onRemove!();
              Navigator.pop(context);
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
