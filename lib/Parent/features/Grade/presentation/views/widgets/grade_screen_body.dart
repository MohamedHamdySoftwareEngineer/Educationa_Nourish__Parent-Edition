import 'package:educational_nourish/Parent/core/utils/styles.dart';
import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:educational_nourish/Parent/features/Grade/presentation/views/widgets/grade_column.dart';
import 'package:flutter/material.dart';
import 'subject_class.dart';

class GradeScreenBody extends StatelessWidget {
  const GradeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Subject> subjects = [
      Subject(
          name: "Arabic", assignmentGrade: 88, quizGrade: 85, finalGrade: 82),
      Subject(name: "Math", assignmentGrade: 85, quizGrade: 78, finalGrade: 90),
      Subject(name: "PE", assignmentGrade: 72, quizGrade: 80, finalGrade: 75),
      Subject(
          name: "Science", assignmentGrade: 78, quizGrade: 75, finalGrade: 80),
      Subject(name: "ICT", assignmentGrade: 95, quizGrade: 92, finalGrade: 88),
      Subject(
          name: "English", assignmentGrade: 83, quizGrade: 66, finalGrade: 89),
    ];
    return BaseScaffold(
      child: Column(
        children: [
          // Header text added before the ListView
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Grades", style: textBold28),
          ),

          // You can add a subheading or description here
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
            child: Text(
              "View your child's grades for each subject",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 16, bottom: 4),
                      child: Text(
                        subject.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GradeColumn(
                              label: 'Assignment',
                              grade: subject.assignmentGrade),
                          GradeColumn(label: 'Quiz', grade: subject.quizGrade),
                          GradeColumn(
                              label: 'Final', grade: subject.finalGrade),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
