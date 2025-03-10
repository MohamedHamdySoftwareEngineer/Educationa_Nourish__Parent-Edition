// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:educational_nourish/Parent/core/utils/app_router.dart';
import 'package:flutter/material.dart';

import 'package:educational_nourish/Parent/core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  final int duration; // Duration in milliseconds

  const SplashScreen({
    super.key,
    this.duration = 3000,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.duration), () {
      if (mounted) {
        GoRouter.of(context).push(AppRouter.rOnBoardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          splashScreen,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}