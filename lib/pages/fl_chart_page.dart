import '../widgets/charts/line_chart_widget.dart';
import '../widgets/charts/bar_chart_widget.dart';
import '../widgets/charts/pie_chart_widget.dart';
import '../widgets/charts/scatter_chart_widget.dart';
import '../widgets/charts/radar_chart_widget.dart';

import 'package:flutter/material.dart';

class FlChartPage extends StatelessWidget {
  const FlChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of charts
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FL Charts Example"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Line"),
              Tab(text: "Bar"),
              Tab(text: "Pie"),
              Tab(text: "Scatter"),
              Tab(text: "Radar"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LineChartWidget(),
            BarChartWidget(),
            PieChartWidget(),
            ScatterChartWidget(),
            RadarChartWidget(),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class FlChartPage extends StatefulWidget {
//   const FlChartPage({super.key});

//   @override
//   State<FlChartPage> createState() => _FlChartPageState();
// }

// class _FlChartPageState extends State<FlChartPage> {
//   int _selectedIndex = 0;

//   final List<String> _tabs = ["Line", "Bar", "Pie", "Scatter", "Radar"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("FL Charts Example")),
//       body: Column(
//         children: [
//           // Tabs
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(_tabs.length, (index) {
//               return ChoiceChip(
//                 label: Text(_tabs[index]),
//                 selected: _selectedIndex == index,
//                 onSelected: (val) {
//                   setState(() {
//                     _selectedIndex = index;
//                   });
//                 },
//               );
//             }),
//           ),

//           const SizedBox(height: 20),

//           // Chart Display
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: _buildChart(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChart() {
//     switch (_selectedIndex) {
//       case 0:
//         return LineChart(
//           LineChartData(
//             gridData: FlGridData(show: true),
//             titlesData: FlTitlesData(show: true),
//             borderData: FlBorderData(show: true),
//             lineBarsData: [
//               LineChartBarData(
//                 isCurved: true,
//                 spots: const [
//                   FlSpot(0, 1),
//                   FlSpot(1, 3),
//                   FlSpot(2, 2),
//                   FlSpot(3, 5),
//                   FlSpot(4, 3.5),
//                 ],
//                 color: Colors.blue,
//                 dotData: FlDotData(show: true),
//               ),
//             ],
//           ),
//         );

//       case 1:
//         return BarChart(
//           BarChartData(
//             alignment: BarChartAlignment.spaceAround,
//             borderData: FlBorderData(show: false),
//             titlesData: FlTitlesData(show: true),
//             barGroups: [
//               BarChartGroupData(
//                 x: 0,
//                 barRods: [BarChartRodData(toY: 8, color: Colors.red)],
//               ),
//               BarChartGroupData(
//                 x: 1,
//                 barRods: [BarChartRodData(toY: 10, color: Colors.orange)],
//               ),
//               BarChartGroupData(
//                 x: 2,
//                 barRods: [BarChartRodData(toY: 14, color: Colors.blue)],
//               ),
//               BarChartGroupData(
//                 x: 3,
//                 barRods: [BarChartRodData(toY: 15, color: Colors.purple)],
//               ),
//             ],
//           ),
//         );

//       case 2:
//         return PieChart(
//           PieChartData(
//             sections: [
//               PieChartSectionData(
//                 value: 10,
//                 color: const Color.fromARGB(255, 84, 188, 138),
//                 radius: 40,
//                 showTitle: true,
//                 titleStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               PieChartSectionData(
//                 value: 20,
//                 color: const Color.fromARGB(255, 187, 143, 49),
//                 radius: 40,
//                 showTitle: true,
//                 titleStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               PieChartSectionData(
//                 value: 30,
//                 color: const Color.fromARGB(255, 152, 19, 92),
//                 radius: 40,
//                 showTitle: true,
//                 titleStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               PieChartSectionData(
//                 value: 40,
//                 color: const Color.fromARGB(255, 39, 9, 137),
//                 radius: 40,
//                 showTitle: true,
//                 titleStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//             sectionsSpace: 2,
//             centerSpaceRadius: 100,
//           ),
//         );

//       case 3:
//         return ScatterChart(
//           ScatterChartData(
//             scatterSpots: const [
              
//             ]
//           ),
//         );

//       default:
//         return const Center(child: Text("No chart selected"));
//     }
//   }
// }
