import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:educational_nourish/Parent/features/Classes/presentation/views/widgets/header_title.dart';
import 'package:flutter/material.dart';

class ClassesScreenBody extends StatelessWidget {
  const ClassesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> subjects = [
      "Math",
      "Science",
      "English",
      "Arabic",
      "ICT",
      "PE"
    ];

    return BaseScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const HeaderTitle(),
              // Search Box
              const SearchBar(),
              const SizedBox(height: 16),
              // Subjects Section
              const Text(
                "subject",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: subjects.map(_buildSubjectContainer).toList(),
                ),
              ),
              const SizedBox(height: 16),
              // Class Schedule Section
              const Text(
                "class schedule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              schedule(),
              const SizedBox(height: 16),
              // Bus Schedules Section
              const Text(
                "Bus schedules",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Departure time  7:30", style: TextStyle(fontSize: 16)),
                  Text("arrival time  3:30", style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView schedule() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: DataTable(
          border: TableBorder.all(color: Colors.black),
          columnSpacing: 16.0,
          horizontalMargin: 15.0,
          headingRowHeight: 40.0,
          dataRowMaxHeight: 40.0,
          dataRowMinHeight: 40.0,
          columns: const [
            DataColumn(label: Text("MON", style: TextStyle(fontSize: 16))),
            DataColumn(label: Text("TUE", style: TextStyle(fontSize: 16))),
            DataColumn(label: Text("WED", style: TextStyle(fontSize: 16))),
            DataColumn(label: Text("THU", style: TextStyle(fontSize: 16))),
            DataColumn(label: Text("SAT", style: TextStyle(fontSize: 16))),
          ],
          rows: [
            DataRow(
                cells: _buildCellsSmall(
                    ["math", "english", "arabic", "RE", "PE"])),
            DataRow(
                cells: _buildCellsSmall(
                    ["science", "math", "english", "arabic", "ICT"])),
            DataRow(
                cells: _buildCellsSmall(
                    ["ICT", "science", "math", "english", "arabic"])),
            DataRow(
                cells: _buildCellsSmall(
                    ["PE", "ICT", "science", "math", "english"])),
            DataRow(
                cells: _buildCellsSmall(
                    ["break", "break", "break", "break", "break"])),
            DataRow(
                cells: _buildCellsSmall(
                    ["science", "math", "english", "RE", "PE"])),
            DataRow(
                cells: _buildCellsSmall(
                    ["math", "english", "science", "arabic", "PE"])),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectContainer(String subject) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 80,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            subject,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  List<DataCell> _buildCellsSmall(List<String> cells) {
    return cells.map((cell) {
      return DataCell(
        Text(
          cell,
          style: const TextStyle(fontSize: 15),
        ),
      );
    }).toList();
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        children: [
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Hinted search text",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search, color: Colors.black),
        ],
      ),
    );
  }
}
