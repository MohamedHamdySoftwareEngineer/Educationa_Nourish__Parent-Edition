import 'package:educational_nourish/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/app_router.dart';
import 'features/Parent Home/presentation/views/parent_home.dart';

void main() {
  runApp(const EduNourish());
}

class EduNourish extends StatelessWidget {
  const EduNourish({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        scaffoldBackgroundColor: mainColor,
      ),
    );
  }
}
