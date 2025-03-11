import 'package:educational_nourish/Parent/constants.dart';
import 'package:educational_nourish/Parent/core/utils/app_router.dart';
import 'package:educational_nourish/Parent/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rSettingsScreen);
              },
              icon: SvgPicture.asset(settingsBottomBar),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rAttendenceScreen);
              },
              icon: SvgPicture.asset(attendenceIcon,width: 35,height: 35,),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rParentHome);
              },
              icon: SvgPicture.asset(homeIconBottomBar),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rBusScreen);
              },
              icon: SvgPicture.asset(busBottomBar),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rParentProfile);
              },
              icon: SvgPicture.asset(userBottomBar),
            ),
          ],
        ),
      ),
    );
  }
}
