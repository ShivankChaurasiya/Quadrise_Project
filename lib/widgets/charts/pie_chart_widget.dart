import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(value: 40, color: Colors.blue, title: "40%"),
            PieChartSectionData(value: 30, color: Colors.green, title: "30%"),
            PieChartSectionData(value: 15, color: Colors.orange, title: "15%"),
            PieChartSectionData(value: 15, color: Colors.red, title: "15%"),
          ],
          sectionsSpace: 2,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}
