import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'profile_detail.dart';

class ParentProfileBody extends StatelessWidget {
  const ParentProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Column(
        children: [
          // Profile header with avatar
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundImage:
                        AssetImage('assets/parent/images/ParentImage.png'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Mohamed Hamdy",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Engineer",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          // Profile details section
          profileDetailsSection(),
        ],
      ),
    );
  }

  Expanded profileDetailsSection() {
    return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
                child: ListView(
                  children: const [
                    SectionHeader(title: "Personal Information"),
                    ProfileDetail(
                      label: "Full Name",
                      value: "Mohamed Hamdy",
                      icon: Icons.person,
                    ),
                    ProfileDetail(
                      label: "Email Address",
                      value: "mohamedhamdy@376.com",
                      icon: Icons.email,
                    ),
                    ProfileDetail(
                      label: "Phone Number",
                      value: "01256997348",
                      icon: Icons.phone,
                    ),
                    ProfileDetail(
                      label: "Date of Birth",
                      value: "1/9/2001",
                      icon: Icons.calendar_today,
                    ),
                    ProfileDetail(
                      label: "Occupation",
                      value: "Engineer",
                      icon: Icons.work,
                    ),
                    SizedBox(height: 16),
                    SectionHeader(title: "Child Information"),
                    ProfileDetail(
                      label: "Child's Name",
                      value: "Piple",
                      icon: Icons.child_care,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}

// A helper widget for section headers
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
