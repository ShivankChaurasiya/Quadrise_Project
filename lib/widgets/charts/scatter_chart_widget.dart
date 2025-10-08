import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ScatterChartWidget extends StatelessWidget {
  const ScatterChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ScatterChart(
        ScatterChartData(
          scatterSpots: [
            ScatterSpot(2.0, 3.0),
            ScatterSpot(4.0, 2.0),
            ScatterSpot(6.0, 5.0),
            ScatterSpot(8.0, 4.0),
          ],
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 10,
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: true),
        ),
      ),
    );
  }
}
