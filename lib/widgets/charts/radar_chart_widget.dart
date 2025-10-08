import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RadarChartWidget extends StatelessWidget {
  const RadarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RadarChart(
        RadarChartData(
          radarBackgroundColor: Colors.transparent,
          borderData: FlBorderData(show: true),
          radarShape: RadarShape.polygon,
          tickCount: 4,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
          dataSets: [
            RadarDataSet(
              fillColor: Colors.blue.withValues(alpha: 0.4),
              borderColor: Colors.blue,
              entryRadius: 3,
              dataEntries: [
                RadarEntry(value: 3),
                RadarEntry(value: 4),
                RadarEntry(value: 2),
                RadarEntry(value: 5),
                RadarEntry(value: 4),
              ],
            ),
            RadarDataSet(
              fillColor: Colors.red.withValues(alpha: 0.4),
              borderColor: Colors.red,
              entryRadius: 3,
              dataEntries: [
                RadarEntry(value: 4),
                RadarEntry(value: 3),
                RadarEntry(value: 5),
                RadarEntry(value: 2),
                RadarEntry(value: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
