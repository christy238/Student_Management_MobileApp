import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_management/View/Widgets/Custom_button.dart';
import 'package:student_management/View/Widgets/Custom_container.dart';
import 'package:student_management/View/constants.dart';

class StudentAttendanceScreen extends StatefulWidget {
  @override
  _StudentAttendanceState createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendanceScreen> {
  final Map<String, List<Map<String, bool>>> _modules = {
    "Math": [
      {"Student 1": true},
      {"Student 2": false},
      {"Student 3": true},
      {"Student 4": false},
      {"Student 5": true},
      {"Student 6": false},
    ],
    "Physics": [
      {"Student 1": true},
      {"Student 2": false},
      {"Student 3": true},
      {"Student 4": false},
      {"Student 5": true},
    ],
    "French": [
      {"Student 1": true},
      {"Student 2": false},
      {"Student 3": true},
      {"Student 4": false},
    ],
  };
  String? _selectedModule;
  bool _showModules = false;

  void _selectModule(String module) {
    setState(() {
      _selectedModule = module;
      _showModules = false; // Hide the module list after selection
    });
  }

  void _toggleAttendance(String module, int index) {
    setState(() {
      _modules[module]![index]
          .update(_modules[module]![index].keys.first, (value) => !value);
    });
  }

  void _toggleModuleList() {
    setState(() {
      _showModules = !_showModules;
    });
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$_selectedModule  Attendance",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "  ${_formatDate(now)}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.expand_more_rounded,
                    color: Colors.white,
                  ),
                  tooltip: 'Select Module',
                  onPressed: _toggleModuleList,
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: buttonClr1,
        toolbarHeight: 150,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_showModules)
              Column(
                children: _modules.keys.map((module) {
                  return ListTile(
                    title: Text(module),
                    onTap: () => _selectModule(module),
                  );
                }).toList(),
              ),
            const SizedBox(height: 20),
            // Student List for Selected Module
            if (_selectedModule != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainer(
                            width: 130,
                            height: 100,
                            color: bgColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '21',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Present',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        CustomContainer(
                            width: 130,
                            height: 100,
                            color: bgColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '06',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Absent',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _modules[_selectedModule]!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          String studentName =
                              _modules[_selectedModule]![index].keys.first;
                          bool isPresent =
                              _modules[_selectedModule]![index].values.first;
                          return ListTile(
                            title: Text(studentName),
                            trailing: Switch(
                              value: isPresent,
                              onChanged: (value) =>
                                  _toggleAttendance(_selectedModule!, index),
                              activeColor: Colors.green,
                              trackOutlineColor: MaterialStateColor.transparent,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor:
                                  const Color.fromARGB(93, 252, 24, 8),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomButton(
                text: 'Confirm Attendance',
                onPressed: () {},
                color: bgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
