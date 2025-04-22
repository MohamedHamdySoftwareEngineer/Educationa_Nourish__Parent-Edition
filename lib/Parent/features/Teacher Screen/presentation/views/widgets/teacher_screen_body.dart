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
      email: "mohamed.hamdy@example.edu",
      imagePath: teacherImage,
      description:
          "Ph.D in Applied Mathematics with 25 years of teaching experience. Specializes in calculus and linear algebra.",
    ),
    Teacher(
      name: "Dr. Michael Chen",
      subject: "Computer Science",
      email: "michael.chen@example.edu",
      imagePath: teacherImage,
      description:
          "Former software engineer with expertise in algorithms and data structures. Has published several research papers on AI.",
    ),
    Teacher(
      name: "Dr. Emily Rodriguez",
      subject: "Biology",
      email: "emily.rodriguez@example.edu",
      imagePath: teacherImage,
      description:
          "Specializes in molecular biology and genetics. Conducts research on cancer cell biology and teaches undergraduate courses.",
    ),
    Teacher(
      name: "Dr. James Wilson",
      subject: "History",
      email: "james.wilson@example.edu",
      imagePath: teacherImage,
      description:
          "Expert in world history with focus on 20th century events. Author of three history textbooks and passionate storyteller.",
    ),
    Teacher(
      name: "Dr. James Wilson",
      subject: "Biology",
      email: "james.wilson.biology.professor@university-example.edu",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Teacher Image at the top
            CircleAvatar(
              radius: 60,
              child: ClipOval(
                child: Image.asset(
                  teacher.imagePath,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey.shade700,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Teacher Info
            // Subject Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                teacher.subject,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            // Teacher Name
            Text(
              teacher.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Teacher Email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 18,
                  color: Colors.grey.shade700,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    teacher.email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Teacher Description
            Text(
              teacher.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}