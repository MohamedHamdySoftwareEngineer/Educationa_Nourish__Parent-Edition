import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/widgets/payment_body.dart';
import 'package:flutter/material.dart';

import 'widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body:  PaymentBody(),
     body: PaymentScreenBody(),
    );
  }
}