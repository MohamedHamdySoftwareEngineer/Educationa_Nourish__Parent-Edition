import 'package:educational_nourish/Parent/constants.dart';
import 'package:educational_nourish/Parent/core/utils/custom_app_bar.dart';
import 'package:educational_nourish/Parent/core/utils/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final List<Color> gradientColors;
  const BaseScaffold({super.key, required this.child,this.gradientColors = const [mainColor, secondColor],});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: const CustomBottomBar(),
        body: Column(
          children: [const CustomAppBar(), Expanded(child: child)],
        ),
      ),
    );
  }
}
