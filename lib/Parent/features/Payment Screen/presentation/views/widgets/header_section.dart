import 'package:educational_nourish/Parent/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Payment data',
            style: textBold28,
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Total price',
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8),
        Text(
          '\$ 2280.00',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 21),
        Text(
          'Payment method',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
