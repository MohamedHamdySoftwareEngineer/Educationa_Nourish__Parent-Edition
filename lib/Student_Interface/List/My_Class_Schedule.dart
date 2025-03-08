import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyClassSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [Icon(Icons.notifications)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Class Schedule",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Hinted search text",
                  prefixIcon: const Icon(Icons.view_list_rounded),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Subjects",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SubjectCard(
                      subject: "Math",
                      imagePath: "assets/student/My_Teachers/teacher3.png"),
                  const SizedBox(width: 10),
                  SubjectCard(
                      subject: "Science",
                      imagePath: "assets/student/My_Teachers/teacher3.png"),
                  const SizedBox(width: 10),
                  SubjectCard(
                      subject: "English",
                      imagePath: "assets/student/My_Teachers/teacher3.png"),
                  const SizedBox(width: 10),
                  SubjectCard(
                      subject: "Arabic",
                      imagePath: "assets/student/My_Teachers/teacher3.png"),
                  const SizedBox(width: 10),
                  SubjectCard(
                      subject: "ICT",
                      imagePath: "assets/student/My_Teachers/teacher3.png"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("Class Schedule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ScheduleTable(),
              ),
            ),
            const Text("Bus schedules",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Departure time: 7:30    Arrival time: 3:30"),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subject;
  final String imagePath;

  SubjectCard({required this.subject, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 30, height: 30),
          const SizedBox(width: 8),
          Text(subject,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ScheduleTable extends StatelessWidget {
  final List<List<String>> scheduleData = [
    ["Time", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    ["8:30", "Math", "English", "Arabic", "RE", "ICT", "PE"],
    ["9:50", "Math", "English", "Science", "ICT", "Math", "RE"],
    ["10:10", "Science", "English", "Arabic", "Math", "PE", "ICT"],
    ["11:30", "RE", "ICT", "Science", "Math", "English", "Arabic"],
    ["12:50", "Break", "Break", "Break", "Break", "Break", "Break"],
    ["2:30", "Math", "English", "Science", "Arabic", "PE", "ICT"],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(),
        columns: scheduleData[0]
            .map((column) => DataColumn(
                label: Text(column,
                    style: const TextStyle(fontWeight: FontWeight.bold))))
            .toList(),
        rows: scheduleData
            .sublist(1)
            .map((row) => DataRow(
                  cells: row
                      .map((cell) => DataCell(Center(child: Text(cell))))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}


















// import 'package:flutter/material.dart';

// class MyClassSchedule extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[200],
//       appBar: AppBar(
//         title: const Text("classes"),
//         backgroundColor: Colors.amber,
//         actions: const [Icon(Icons.notifications)],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Hinted search text",
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 fillColor: Colors.white,
//                 filled: true,
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Row(
//               children: [
//                 SubjectCard(subject: "Math", imagePath: "assets/student/My_Teachers/teacher3.png"),
//                 SizedBox(width: 10),
//                 SubjectCard(subject: "Science", imagePath: "assets/student/My_Teachers/teacher3.png"),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text("Class Schedule", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: ScheduleTable(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text("Bus schedules", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const Text("Departure time: 7:30    Arrival time: 3:30"),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "Schedule"),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//         ],
//       ),
//     );
//   }
// }

// class SubjectCard extends StatelessWidget {
//   final String subject;
//   final String imagePath;

//   const SubjectCard({required this.subject, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(imagePath, width: 30, height: 30),
//             const SizedBox(width: 8),
//             Text(subject, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ScheduleTable extends StatelessWidget {
//   final List<List<String>> scheduleData = [
//     ["Time", "Mon", "Tue", "Wed", "Thu", "Sat"],
//     ["8:30", "Math", "English", "Arabic", "RE", "PE"],
//     ["9:50", "Math", "English", "Arabic", "ICT", ""],
//     ["10:10", "Science", "English", "", "Arabic", ""],
//     ["11:30", "RE", "ICT", "Science", "Math", "English"],
//     ["12:50", "Break", "Break", "Break", "Break", "Break"],
//     ["2:30", "Math", "English", "Science", "Arabic", "PE"],
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       border: TableBorder.all(),
//       children: scheduleData.map((row) {
//         return TableRow(
//           children: row.map((cell) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(child: Text(cell, style: const TextStyle(fontSize: 16))),
//             );
//           }).toList(),
//         );
//       }).toList(),
//     );
//   }
// }

