import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:student_management/View/constants.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weekly Reports",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: buttonClr1, // Change as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // First Row of Containers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatContainer('26', 'Total Students', bgColor),
                  const SizedBox(width: 20),
                  _buildStatContainer('90%', 'Overall', buttonClr1),
                ],
              ),
              const SizedBox(height: 16),
              // Second Row of Containers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatContainer('16', 'Total Presence', buttonClr1),
                  const SizedBox(width: 20),
                  _buildStatContainer('10', 'Total Absence', bgColor),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Overview',
                style: TextStyle(
                    color: buttonClr1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              // Chart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: AttendanceChart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatContainer(String title, String value, Color color) {
    return Container(
      height: 110,
      width: 140,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: color, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AttendanceChart extends StatelessWidget {
  final List<FlSpot> dailyAttendance = [
    FlSpot(0, 30), // Day 1
    FlSpot(1, 50), // Day 2
    FlSpot(2, 48), // Day 3
    FlSpot(3, 60), // Day 4
    FlSpot(4, 50), // Day 5
    FlSpot(5, 60), // Day 6
    FlSpot(6, 100), // Day 7
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toInt().toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                List<String> days = [
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat',
                  'Sun'
                ];
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    days[value.toInt()],
                    style: TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: bgColor, width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: dailyAttendance,
            isCurved: false,
            color: Colors.black,
            barWidth: 2,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
