import 'package:flutter/material.dart';
import 'package:student_management/View/Widgets/Attendance_Circle.dart';
import 'package:student_management/View/Widgets/Attendance_Table.dart';
import 'package:student_management/View/Widgets/StudentProgressChart.dart';
import 'package:student_management/View/constants.dart';

class Student_DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard",
            style: TextStyle(
                color: Color.fromARGB(255, 250, 243, 243),
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: buttonClr1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Student Progress ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: buttonClr1),
                ),
                Expanded(
                  child: ProgressChart(),
                ),
                SizedBox(height: 30),
                AttendanceCircle(attendancePercentage: 80),
                SizedBox(height: 20),
                AttendanceTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
