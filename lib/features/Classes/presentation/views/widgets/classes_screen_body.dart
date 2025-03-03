import 'package:educational_nourish/core/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class ClassesScreenBody extends StatelessWidget {
  const ClassesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
      child: Container(
        // color: const Color(0xFFA4D4EF),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Box
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 16),
                  child: Text(
                    'classes',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.menu, color: Colors.black),
                    SizedBox(
                      width: 16,
                    ),
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
              ),
              const SizedBox(height: 16),

              // Subject Section
              const Text(
                "subject",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Math",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Image(
                          image: AssetImage(
                              'assets/classes_screen/math_image.png'),
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Science",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Class Schedule Section
              const Text(
                "class schedule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: DataTable(
                    border: TableBorder.all(color: Colors.black),
                    columnSpacing:
                        16.0, // Reduce column spacing (default is 56.0)
                    horizontalMargin:
                        15.0, // Reduce horizontal margin (default is 24.0)
                    headingRowHeight:
                        40.0, // Reduce header row height (default is 56.0)
                    dataRowMaxHeight:
                        40.0, // Reduce data row height (default is 48.0)
                    dataRowMinHeight: 40.0, // Minimum height for data rows
                    columns: const [
                      DataColumn(
                          label: Text("MON", style: TextStyle(fontSize: 16))),
                      DataColumn(
                          label: Text("TUE", style: TextStyle(fontSize: 16))),
                      DataColumn(
                          label: Text("WED", style: TextStyle(fontSize: 16))),
                      DataColumn(
                          label: Text("THU", style: TextStyle(fontSize: 16))),
                      DataColumn(
                          label: Text("SAT", style: TextStyle(fontSize: 16))),
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
                              ["RE", "ICT", "science", "math", "english"])),
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
              ),
              const SizedBox(height: 16),

              // Bus Schedules
              const Text(
                "Bus schedules",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "Departure time  7:30",
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "arrival time  3:30",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataCell> _buildCellsSmall(List<String> cells) {
    return cells
        .map((cell) => DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 2.0), // Reduce vertical padding
                child: Text(
                  cell,
                  style: const TextStyle(fontSize: 15), // Smaller font size
                ),
              ),
            ))
        .toList();
  }
}
