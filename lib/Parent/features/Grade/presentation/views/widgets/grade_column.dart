import 'package:flutter/material.dart';

class GradeColumn extends StatelessWidget {
  final String label;
  final int grade;

  const GradeColumn({
    super.key,
    required this.label,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text('$grade', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

// Model class to represent a subject and its grades.
