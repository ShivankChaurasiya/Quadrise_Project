import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: const [
                FlSpot(0.0, 1.0),
                FlSpot(1.0, 3.0),
                FlSpot(2.0, 2.0),
                FlSpot(3.0, 5.0),
                FlSpot(4.0, 3.5),
                FlSpot(5.0, 4.0),
              ],
              color: Colors.blue,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
