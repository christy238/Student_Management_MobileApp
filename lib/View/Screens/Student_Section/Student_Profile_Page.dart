import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_management/View/Widgets/Custom_container.dart';
import 'package:student_management/View/constants.dart';

// ignore: camel_case_types
class Student_Profile extends StatefulWidget {
  Student_Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Student_ProfileState createState() => _Student_ProfileState();
}

// ignore: camel_case_types
class _Student_ProfileState extends State<Student_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomContainer(
                width: double.infinity,
                height: 230,
                color: buttonClr1,
                child: Column(
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Student Name',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: CustomContainer(
                      width: double.infinity,
                      height: 450,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Student ID',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Course',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Semester',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Responsible Party',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '@gmail.com',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '1234',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'BGD',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 230,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     CustomContainer(
                          //       width: 80,
                          //       height: 80,
                          //       color: bgColor,
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           IconButton(
                          //             icon: Icon(
                          //               Icons.school,
                          //               size: 40,
                          //               color: Colors.white,
                          //             ),
                          //             tooltip: 'Student',
                          //             onPressed: () {
                          //               Navigator.pushNamed(
                          //                   context, '/student');
                          //             },
                          //           ),
                          //           const Text(
                          //             'Profile',
                          //             style: TextStyle(
                          //               color: Colors.white,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 30,
                          //     ),
                          //     CustomContainer(
                          //       width: 80,
                          //       height: 80,
                          //       color: bgColor,
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           IconButton(
                          //             icon: Icon(
                          //               Icons.person,
                          //               size: 40,
                          //               color: Colors.white,
                          //             ),
                          //             tooltip: 'Student',
                          //             onPressed: () {
                          //               Navigator.pushNamed(
                          //                   context, '/student');
                          //             },
                          //           ),
                          //           const Text(
                          //             'Students',
                          //             style: TextStyle(
                          //               color: Colors.white,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      )),
                ),
              ),
              // const SizedBox(
              //   height: 200,
              // ),

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
