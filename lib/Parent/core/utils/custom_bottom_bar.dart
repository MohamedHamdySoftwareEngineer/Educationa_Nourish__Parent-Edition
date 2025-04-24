import 'package:educational_nourish/Parent/core/utils/constants.dart';
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
                GoRouter.of(context).push(AppRouter.rListScreen);
              },
              icon:  SvgPicture.asset(listIcon,width: 32,height: 32,),
            ),
            
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rBusScreen);
              },
              
              icon: const Icon(Icons.directions_bus_sharp,size: 33,color: Colors.black,),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rParentHome);
              },
              icon: SvgPicture.asset(homeIconBottomBar),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rGradeScreen);
              },
             
              icon: SvgPicture.asset('assets/parent/icons/Star.svg'),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.rSettingsScreen);
              },
              icon: SvgPicture.asset(settingsBottomBar),
             
            ),
          ],
        ),
      ),
    );
  }
}
