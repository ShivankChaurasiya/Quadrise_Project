import 'package:flutter/material.dart';

class RecentOrdersTable extends StatelessWidget {
  final List<Map<String, String>> orders;

  const RecentOrdersTable({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // 🔹 fixed height for vertical scrolling
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // ✅ horizontal scroll
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // ✅ vertical scroll
          child: DataTable(
            border: TableBorder.all(color: Colors.grey.shade300),
            columns: const [
              DataColumn(label: Text("Order ID")),
              DataColumn(label: Text("Customer")),
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("Status")),
              DataColumn(label: Text("Total")),
            ],
            rows: orders
                .map(
                  (order) => DataRow(
                    cells: [
                      DataCell(Text(order["id"] ?? "")),
                      DataCell(Text(order["customer"] ?? "")),
                      DataCell(Text(order["date"] ?? "")),
                      DataCell(Text(order["status"] ?? "")),
                      DataCell(Text(order["total"] ?? "")),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
