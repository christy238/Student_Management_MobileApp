import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:student_management/View/constants.dart';

class AttendanceCircle extends StatelessWidget {
  final double attendancePercentage;

  const AttendanceCircle({required this.attendancePercentage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 25.0,
        percent: attendancePercentage / 100,
        center: Text(
          "${attendancePercentage.toStringAsFixed(1)}%",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        progressColor: bgColor,
      ),
    );
  }
}
