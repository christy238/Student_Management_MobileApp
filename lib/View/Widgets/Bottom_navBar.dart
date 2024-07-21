// ignore: file_names
import 'package:flutter/material.dart';
import 'package:student_management/View/Screens/Login_Section/Login_Page.dart';
import 'package:student_management/View/Screens/Login_Section/Welcom_Page.dart';

import 'package:student_management/View/Screens/Student_Section/Student_Profile_Page.dart';
import 'package:student_management/View/Screens/Student_Section/Student_dashboard_Page.dart';
import 'package:student_management/View/Screens/Teacher_Section/Add_Student_Page.dart';
import 'package:student_management/View/Screens/Teacher_Section/Student_Attendance_Page.dart';
import 'package:student_management/View/Screens/Teacher_Section/Teacher_Dashboard_Page.dart';
import 'package:student_management/View/Screens/Teacher_Section/Teacher_Profile_Page.dart';
import 'package:student_management/View/constants.dart';

// ignore: camel_case_types
class Bottom_bar extends StatefulWidget {
  const Bottom_bar({super.key});

  @override
  State<Bottom_bar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Bottom_bar> {
  int _selectedIndex = 0;
  // ignore: non_constant_identifier_names
  static final List<Widget> _StudentNav = <Widget>[
    Student_Profile(),
    Student_DashBoard(),
    Welcome_Page()
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _logout();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Welcome_Page()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _StudentNav[_selectedIndex]),
        backgroundColor: const Color.fromARGB(255, 241, 240, 243),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: bgColor,
          selectedIconTheme: const IconThemeData(
            color: bgColor,
          ),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color.fromARGB(172, 91, 94, 110),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined_outlined),
                label: "charge compte"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_rounded), label: "Logout"),
          ],
        ));
  }
}
