import 'package:flutter/material.dart';
import 'drawer_page.dart';

class MyTeachers extends StatelessWidget {
  const MyTeachers({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'Teachers',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Custom back arrow
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined, size: 30),
            onPressed: () {},
          )
        ],
      ),
      drawer: const DrawerPage(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xfffacf74), // Top color
                  Color(0xffe8ba5c), // Bottom color
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: GridView.count(
                crossAxisCount: 2, // 2 columns
                mainAxisSpacing: 16.0, // space between rows
                crossAxisSpacing: 16.0, // space between columns
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildTeacherCard(
                    name: "Ali Khaled",
                    subject: "Maths",
                    color: Colors.blueAccent,
                  ),
                  _buildTeacherCard(
                    name: "Moamen",
                    subject: "Science",
                    color: Colors.amberAccent,
                  ),
                  _buildTeacherCard(
                    name: "Mario Samy",
                    subject: "English",
                    color: Colors.pinkAccent,
                  ),
                  _buildTeacherCard(
                    name: "Mohasseb",
                    subject: "French",
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherCard({
    required String name,
    required String subject,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 60, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subject,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
