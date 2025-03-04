import 'package:educational_nourish/Parent/core/utils/custom_app_bar.dart';
import 'package:educational_nourish/Parent/core/utils/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class BaseWidgets extends StatelessWidget {
  final Widget child;
  const BaseWidgets({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      body: Column(
        children: [const CustomAppBar(), Expanded(child: child)],
      ),
    );
  }
}
