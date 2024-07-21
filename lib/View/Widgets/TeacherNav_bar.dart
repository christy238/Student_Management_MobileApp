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
class TeacherNav_Bar extends StatefulWidget {
  const TeacherNav_Bar({super.key});

  @override
  State<TeacherNav_Bar> createState() => _TeacherNav_Bar();
}

class _TeacherNav_Bar extends State<TeacherNav_Bar> {
  int _selectedIndex = 0;
  // ignore: non_constant_identifier_names

  static final List<Widget> _TeacherNav = <Widget>[
    Teacher_Profile(),
    AddStudentScreen(),
    ReportScreen(),
    StudentAttendanceScreen(),
    Welcome_Page(),
  ];

  void _onItemTapped(int index) {
    if (index == 4) {
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
        body: Center(child: _TeacherNav[_selectedIndex]),
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.checklist_rtl), label: "Add Student"),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined_outlined),
                label: "Reports"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_rounded), label: "Attendance"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_rounded), label: "Logout"),
          ],
        ));
  }
}
