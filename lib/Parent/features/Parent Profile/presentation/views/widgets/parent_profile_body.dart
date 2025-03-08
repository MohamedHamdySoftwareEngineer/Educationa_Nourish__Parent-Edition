import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

import 'profile_detail.dart';

class ParentProfileBody extends StatelessWidget {
  const ParentProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Move the CircleAvatar to the desired position
            Positioned(
              top:
                  20, // Adjust this to match the red circle's vertical position
              left: MediaQuery.of(context).size.width / 2 -
                  50, // Center horizontally
              child: const CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/parent/images/ParentImage.png'),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: const [
                        ProfileDetail(
                            label: "YourName", value: "Mohamed Hamdy"),
                        ProfileDetail(
                            label: "Email", value: "mohamedhamdy@376.com"),
                        ProfileDetail(label: "Phone", value: "01256997348"),
                        ProfileDetail(label: "Your Job", value: "Engineer"),
                        ProfileDetail(label: "BirthDay", value: "1/9/2001"),
                        ProfileDetail(label: "Your Child Name", value: "Piple"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
