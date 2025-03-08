import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:educational_nourish/Parent/features/Parent%20Home/presentation/views/widgets/my_parent_body.dart';
import 'package:flutter/material.dart';

class ParentHomeBody extends StatelessWidget {
  const ParentHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      child: Column(
        children: [
          Expanded(child: MyParentBody()),
        ],
      ),
    );
  }
}
