
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_management/View/Widgets/Custom_button.dart';
import 'package:student_management/View/constants.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final Map<String, List<String>> _modules = {
    "Math": [
      "Student 1",
      "Student 2",
      "Student 3",
      "Student 4",
      "Student 5",
      "Student 6",
      "Student 7"
    ],
    "Physics": [
      "Student 1",
      "Student 2",
      "Student 3",
      "Student 4",
      "Student 5",
    ],
    "French": [
      "Student 1",
      "Student 2",
      "Student 3",
      "Student 4",
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

  void _removeStudent(String module, int index) {
    setState(() {
      _modules[module]!.removeAt(index);
    });
  }

  void _validateStudent(String module, int index) {
  
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
            const Text(
              "Add Student",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Date: ${_formatDate(now)}",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                IconButton(
                  icon:const Icon(
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
            // Display current date

            // Conditionally show the module list
            if (_showModules)
              Column(
                children: _modules.keys.map((module) {
                  return ListTile(
                    title: Text(module),
                    onTap: () => _selectModule(module),
                  );
                }).toList(),
              ),
            SizedBox(height: 20),
            // Student List for Selected Module
            if (_selectedModule != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$_selectedModule Students",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _modules[_selectedModule]!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_modules[_selectedModule]![index]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add_box_rounded,
                                    color: Colors.green,
                                  ),
                                  onPressed: () =>
                                      _validateStudent(_selectedModule!, index),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                  onPressed: () =>
                                      _removeStudent(_selectedModule!, index),
                                ),
                              ],
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
                text: 'Done',
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
