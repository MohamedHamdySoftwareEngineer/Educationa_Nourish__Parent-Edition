import 'package:educational_nourish/Parent/features/Parent%20Home/presentation/views/parent_home.dart';

import 'package:educational_nourish/login/login_screen.dart';
import 'package:flutter/material.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade700,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              
              // App logo/icon
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.school,
                  size: 60,
                  color: Colors.blue.shade700,
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Heading
              const Text(
                'Choose Your Role',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(height: 10),
              
              // Subheading
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Select which option best describes your role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Role selection cards
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildRoleCard(
                        context,
                        'Parent',
                        Icons.family_restroom,
                        'Access your child\'s progress and communicate with teachers',
                        Colors.orange.shade400,
                        () => _navigateToHome(context, 'parent'),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      _buildRoleCard(
                        context,
                        'Student',
                        Icons.person,
                        'Access your courses, assignments, and learning materials',
                        Colors.green.shade400,
                        () => _navigateToHome(context, 'student'),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      _buildRoleCard(
                        context,
                        'Teacher',
                        Icons.psychology,
                        'Manage your classes, assignments, and student progress',
                        Colors.purple.shade400,
                        () => _navigateToHome(context, 'teacher'),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Navigation function
  void _navigateToHome(BuildContext context, String role) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          switch (role) {
            case 'parent':
              return const ParentHome();
            // case 'student':
            //   return const HomePage();
            case 'teacher':
              return const LoginScreen();
            default:
              return const ChoiceScreen();
          }
        },
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, String title, IconData icon, String description, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                   
                    
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
