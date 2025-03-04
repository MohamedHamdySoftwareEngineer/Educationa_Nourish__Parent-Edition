import 'package:educational_nourish/Parent/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.rParentHome);
            },
          ),
          const Row(
            children: [
              Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.logout,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
