import 'package:educational_nourish/Parent/constants.dart';
import 'package:educational_nourish/Parent/core/utils/assets.dart';
import 'package:educational_nourish/Parent/core/utils/custom_bottom_bar.dart';
import 'package:educational_nourish/Parent/core/widgets/base_widgets.dart';
import 'package:educational_nourish/Parent/features/Parent%20Home/presentation/views/widgets/my_parent_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/custom_app_bar.dart';

class ParentHomeBody extends StatelessWidget {
  const ParentHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseWidgets(
      child: Column(
        children: [
          Expanded(child: MyParentBody()),
        ],
      ),
    );
  }
}
