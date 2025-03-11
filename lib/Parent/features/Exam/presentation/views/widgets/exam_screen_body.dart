import 'package:educational_nourish/Parent/constants.dart';
import 'package:educational_nourish/Parent/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';

class Exam {
  final String type;
  final String subject;
  final DateTime dateTime;

  Exam({required this.type, required this.subject, required this.dateTime});
}

class ExamScreenBody extends StatefulWidget {
  const ExamScreenBody({super.key});

  @override
  State<ExamScreenBody> createState() =>
      _ExamScreenBodyState(); // Corrected this line
}

class _ExamScreenBodyState extends State<ExamScreenBody> {
  final List<Exam> exams = [
    Exam(
        type: 'Midterm',
        subject: 'Math',
        dateTime: DateTime(2025, 5, 15, 10, 0)),
    Exam(
        type: 'Final',
        subject: 'Arabic',
        dateTime: DateTime(2025, 6, 20, 14, 0)),
    Exam(
        type: 'Quiz',
        subject: 'English',
        dateTime: DateTime(2025, 5, 10, 9, 30)),
    Exam(
        type: 'Midterm',
        subject: 'Science',
        dateTime: DateTime(2025, 5, 25, 11, 0)),
    Exam(
        type: 'Final', subject: 'Math', dateTime: DateTime(2025, 6, 15, 13, 0)),
  ];

  String? selectedType;
  String? selectedSubject;

  String _formatExamDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, yyyy • h:mm a').format(dateTime);
  }

  List<Exam> get filteredExams {
    return exams
        .where((exam) =>
            (selectedType == null || exam.type == selectedType) &&
            (selectedSubject == null || exam.subject == selectedSubject))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Column(
        children: [
          _buildFilterSection(), 
          _buildExamList(),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildDropdown(
              labelText: 'Exam Type', // This will appear on the border
              hintText: 'All', // This will appear inside the dropdown
              value: selectedType,
              items: exams.map((e) => e.type).toSet().toList(),
              onChanged: (value) => setState(() => selectedType = value),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildDropdown(
              labelText: 'Exam Subject', // This will appear on the border
              hintText: 'All', // This will appear inside the dropdown
              value: selectedSubject,
              items: exams.map((e) => e.subject).toSet().toList(),
              onChanged: (value) => setState(() => selectedSubject = value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String labelText, // Text that appears on the border
    required String
        hintText, // Text that appears inside when nothing is selected
    required String? value,
    required List<String> items,
    required void Function(String?)? onChanged,
  }) {
    // Create a list to hold all DropdownMenuItem widgets
    List<DropdownMenuItem<String>> dropdownItems = [];

    // Add the default option as the first item in the dropdown
    dropdownItems.add(
      DropdownMenuItem<String>(
        value: null,
        child: Text(hintText, style: const TextStyle(color: Colors.black)),
      ),
    );

    // Loop through the items list and add each as a DropdownMenuItem
    for (String item in items) {
      dropdownItems.add(
        DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        ),
      );
    }

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText, // This is the text on the border
        border: customBorder,
        enabledBorder: customBorder,
        focusedBorder: customBorder,
      ),
      value: value,
      items: dropdownItems,
      onChanged: onChanged,
      hint: Text(hintText), // This is the hint text inside the dropdown
      isExpanded: true,
    );
  }

  

  Widget _buildExamList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredExams.length,
        itemBuilder: (context, index) {
          final exam = filteredExams[index];
          return Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          exam.subject,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 90, 
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          exam.type,
                          style: mainText18.copyWith(fontSize: 16),
                          textAlign: TextAlign.center, // Center the text
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 6),
                      Text(
                        _formatExamDate(exam.dateTime),
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}