import 'package:flutter/material.dart';

import 'My_Class_Schedule.dart';
import 'my_teachers.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xffe8ba5c),
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              width: double.infinity,
              height: 150,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/Intro_Screen_login/boy.png'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Mario Samy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'MarioSamy@gamil.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.black,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.book,
                size: 30,
                color: Colors.black,
              ),
              title: const Text(
                'ُExams',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 30,
                color: Colors.black,
              ),
              title: const Text(
                'My Teachers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyTeachers(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 30,
                color: Colors.black,
              ),
              title: const Text(
                'My Class Schedule',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  MyClassSchedule(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}












// import 'package:flutter/material.dart';

// class DrawerPage extends StatelessWidget {
//   const DrawerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor:Colors.transparent,
//       child: Column(
//         children: [
//           Container(
//             color: Colors.transparent,
//             width: double.infinity,
//             height: 150,
//             child: const CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/boy.png'),
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Mario Samy',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const Text(
//             'MarioSamy@gamil.com',
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 20),
//           const Divider(
//             color: Colors.black,
//             thickness: 2,
//             indent: 20,
//             endIndent: 20,
//           ),
//           const SizedBox(height: 20),
//           ListTile(
//             leading: const Icon(
//               Icons.home,
//               size: 30,
//               color: Colors.black,
//             ),
//             title: const Text(
//               'Home',
//               style: TextStyle(
//                   fontSize: 23,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.person,
//               size: 30,
//               color: Colors.black,
//             ),
//             title: const Text(
//               'Teachers Info',
//               style: TextStyle(
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
