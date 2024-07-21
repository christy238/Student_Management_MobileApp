import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:student_management/View/constants.dart';

class ProgressChart extends StatelessWidget {
  final List<FlSpot> studentProgress = [
    FlSpot(0, 30), // January
    FlSpot(1, 10), // February
    // March
    FlSpot(2, 80), // April
    FlSpot(3, 30),
    FlSpot(4, 35), //
    FlSpot(5, 200),
    FlSpot(6, 40), // May
    FlSpot(7, 60),
    FlSpot(8, 25), // June
    // August
    // December
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 250,
        gridData: const FlGridData(show: false),
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
              getTitlesWidget: (value, meta) {
                if (studentProgress.any((spot) => spot.y == value)) {
                  return Text('${value.toInt()}');
                }
                return Container();
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text('Jan');
                  case 1:
                    return Text('Feb');
                  case 2:
                    return Text('Mar');
                  case 3:
                    return Text('Apr');
                  case 4:
                    return Text('May');
                  case 5:
                    return Text('Jun');
                  case 6:
                    return Text('Jul');
                }
                return Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: buttonClr1, width: 2),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: studentProgress,
            isCurved: true,
            color: bgColor,
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: false,
              color: bgColor.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
