import 'package:flutter/material.dart';

class AttendanceTable extends StatelessWidget {
  final List<Map<String, String>> attendanceData = [
    {"module": "Math", "time": "10:15 - 11:00", "status": "Present"},
    {"module": "Physics", "time": "11:15 - 12:00", "status": "Absent"},
    {"module": "English", "time": "12:15 - 1:00", "status": "Present"},
    {"module": "French", "time": "1:15 - 2:00", "status": "Present"},
    // Add more rows as needed
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Module")),
        DataColumn(label: Text("Time")),
        DataColumn(label: Text("Status")),
      ],
      rows: attendanceData.map((data) {
        return DataRow(cells: [
          DataCell(Text(data["module"]!)),
          DataCell(Text(data["time"]!)),
          DataCell(Text(data["status"]!)),
        ]);
      }).toList(),
    );
  }
}
