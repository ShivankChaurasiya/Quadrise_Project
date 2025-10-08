import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}
class _OrdersPageState extends State<OrdersPage> {
  String searchQuery = '';
  String statusFilter = 'All';

  
final List<Map<String, String>> allOrders = [
  {"id": "001", "customer": "Alice", "date": "2024-10-01", "status": "Pending"},
  {"id": "002", "customer": "Bob", "date": "2024-10-02", "status": "Shipped"},
  {"id": "003", "customer": "Charlie", "date": "2024-10-03", "status": "Delivered"},
  {"id": "004", "customer": "Diana", "date": "2024-10-04", "status": "Cancelled"},
  {"id": "005", "customer": "Eve", "date": "2024-10-05", "status": "Pending"},
] ;
@override
  Widget build(BuildContext context) {
    final filteredOrders = allOrders.where((order) {
      final matchesSearch = order['customer']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          order['id']!.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesStatus = statusFilter == 'All' || order['status'] == statusFilter;
      return matchesSearch && matchesStatus;
    }).toList();
    Color getStatusColor(String status) {
      switch (status) {
        case 'Pending':
          return Colors.orange;
        case 'Shipped':
          return Colors.blue;
        case 'Delivered':
          return Colors.green;
        case 'Cancelled':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        TextField(
          decoration: const InputDecoration(
            hintText: "Search by customer name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text("Filter by status: "),
            const SizedBox(width: 10),
            DropdownButton<String>(
              value: statusFilter,
              items: ['All', 'Pending', 'Shipped', 'Delivered', 'Cancelled']
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  statusFilter = value!;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Order ID')),
                DataColumn(label: Text('Customer')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Status')),
              ],
              rows: filteredOrders.map((order) {
                return DataRow(cells: [
                  DataCell(Text(order['id']!)),
                  DataCell(Text(order['customer']!)),
                  DataCell(Text(order['date']!)),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: getStatusColor(order['status']!).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        order['status']!,
                        style: TextStyle(
                          color: getStatusColor(order['status']!),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]);
              }).toList(),
            ),
        

          ),
        )
      ]
      
          
        )
      ),
    );    
  }
}
