import 'package:flutter/material.dart';
import 'BtmNavBar/Exams.dart';
import 'List/drawer_page.dart';
import 'Home/home_page.dart';
import 'BtmNavBar/profile_page.dart';
import 'BtmNavBar/Settings.dart';

class BtmNavBarStudent extends StatefulWidget {
  const BtmNavBarStudent({super.key});

  @override
  State<BtmNavBarStudent> createState() => _BtmNavBarStudentState();
}

class _BtmNavBarStudentState extends State<BtmNavBarStudent> {
  int _selectedIndex = 2;

  void _navigateBottomBar(int index) {
    if (index == 4) {
      _showSettingsModal();
    } else if (index == 0) {
      _openDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showSettingsModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: const SettingsPage(),
      ),
    );
  }

  void _openDrawer() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width * 1,
        child: const DrawerPage(),
      ),
    );
  }

  final List<Widget> _pages = [
    const Exams(),
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _selectedIndex < 1
            ? _pages[_selectedIndex]
            : _pages[_selectedIndex - 1],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffe8ba5c),
          elevation: 0,
          selectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold), // Increase selected label size
          unselectedLabelStyle:
              const TextStyle(fontSize: 14,), // Increase unselected label size
          onTap: _navigateBottomBar,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 30,
              ),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                size: 30,
              ),
              label: 'Exams',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              label: 'Settings',
            ),
          ],
        ));
  }
}
