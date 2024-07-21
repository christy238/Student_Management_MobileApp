import 'package:flutter/material.dart';
import 'package:student_management/View/Screens/navigation.dart';
import 'package:student_management/View/constants.dart';

import 'package:student_management/View/Widgets/TeacherNav_bar.dart';

class Welcome_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(height: 80),
            const Text('Please choose your profile',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: Colors.white)),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 233, 248),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.school,
                      size: 70,
                      color: Color.fromARGB(255, 91, 118, 228),
                    ),
                    tooltip: 'Student',
                    onPressed: () {
                      Navigator.pushNamed(context, '/student');
                    },
                  ),
                ),
                const SizedBox(width: 40),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 233, 248),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.person,
                      size: 70,
                      color: Color.fromARGB(255, 91, 118, 228),
                    ),
                    tooltip: 'Teacher',
                    onPressed: () {
                      navigateToPage(context, TeacherNav_Bar());
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
