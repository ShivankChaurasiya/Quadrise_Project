import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: true),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [BarChartRodData(toY: 8.0, color: Colors.blue)],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [BarChartRodData(toY: 10.0, color: Colors.green)],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [BarChartRodData(toY: 14.0, color: Colors.orange)],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [BarChartRodData(toY: 15.0, color: Colors.purple)],
            ),
          ],
        ),
      ),
    );
  }
}
