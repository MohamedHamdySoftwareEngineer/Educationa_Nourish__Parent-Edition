import 'package:educational_nourish/features/Payment%20Screen/presentation/views/widgets/payment_body.dart';
import 'package:educational_nourish/features/Payment%20Screen/presentation/views/widgets/payment_method_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodSelector extends StatelessWidget {
  final String selectedMethod;
  final Function(String) onMethodSelected;

  const PaymentMethodSelector({super.key, 
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['Credit', 'Debit', 'Paypal'].map((method) => 
        PaymentMethodButton(
          label: method,
          isSelected: selectedMethod == method,
          onTap: () => onMethodSelected(method),
        )
      ).toList(),
    );
  }
}
