import 'package:educational_nourish/Parent/core/utils/app_router.dart';
import 'package:educational_nourish/Parent/core/utils/assets.dart';
import 'package:educational_nourish/Parent/features/Parent%20Home/presentation/views/widgets/build_icon_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyParentBody extends StatelessWidget {
  const MyParentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // News Box
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Image.asset(schoolNews),
        ),

        // Cards Grid
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(25),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const BuildIconCard(
                  label: 'Teacher',
                  imagePath: teacherHome,
                  top: -60,
                  left: 20,
                  bottom: 40,
                  right: 20),
              InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.rMyChildScreen);
                  },
                  child: const BuildIconCard(
                      label: 'My child',
                      imagePath: studentHome,
                      top: -50,
                      left: 20,
                      bottom: 40,
                      right: 20)),
              const BuildIconCard(
                  label: 'Restaurant',
                  imagePath: restaurantHome,
                  top: 0,
                  left: 20,
                  bottom: 40,
                  right: 20),
              const BuildIconCard(
                  label: 'Payment',
                  imagePath: paymentHome,
                  top: 10,
                  left: 20,
                  bottom: 50,
                  right: 20),
            ],
          ),
        ),
      ],
    );
  }
}
