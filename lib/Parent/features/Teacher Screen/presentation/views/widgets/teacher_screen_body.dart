import 'package:educational_nourish/Parent/constants.dart';
import 'package:educational_nourish/Parent/core/utils/assets.dart';
import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:educational_nourish/Parent/features/Teacher%20Screen/presentation/views/widgets/teacher_class.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TeacherScreenBody extends StatelessWidget {
  final List<Teacher> teachers = [
    Teacher(
      name: "Prof. Mohamed Hamdy",
      subject: "Mathematics",
      imagePath: teacherImage,
      description:
          "Ph.D in Applied Mathematics with 25 years of teaching experience. Specializes in calculus and linear algebra.",
    ),
    Teacher(
      name: "Dr. Michael Chen",
      subject: "Computer Science",
      imagePath: teacherImage,
      description:
          "Former software engineer with expertise in algorithms and data structures. Has published several research papers on AI.",
    ),
    Teacher(
      name: "Dr. Emily Rodriguez",
      subject: "Biology",
      imagePath: teacherImage,
      description:
          "Specializes in molecular biology and genetics. Conducts research on cancer cell biology and teaches undergraduate courses.",
    ),
    Teacher(
      name: "Dr. James Wilson",
      subject: "History",
      imagePath: teacherImage,
      description:
          "Expert in world history with focus on 20th century events. Author of three history textbooks and passionate storyteller.",
    ),
    Teacher(
      name: "Dr. James Wilson",
      subject: "Biology",
      imagePath: teacherImage,
      description:
          "Specializes in molecular biology and genetics. Conducts research on cancer cell biology and teaches undergraduate courses.",
    ),
  ];
  TeacherScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Teachers", style: textBold28),
          ),

          // You can add a subheading or description here
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
            child: Text(
              "View your child's teachers for each subject",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
            Expanded(
              child: ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  return TeacherCard(teacher: teachers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final Teacher teacher;

  const TeacherCard({
    super.key,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Teacher Image
            CircleAvatar(
              radius: 50,
              // to force image to be oval
              child: ClipOval(
                child: Image.asset(
                  teacher.imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey.shade700,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Teacher Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subject Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      teacher.subject,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  // Teacher Name
                  Text(
                    teacher.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Teacher Description
                  Text(
                    teacher.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}