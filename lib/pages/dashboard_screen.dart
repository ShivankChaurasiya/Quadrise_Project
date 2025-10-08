import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import '../widgets/overview_card.dart';
import '../widgets/revenue_chart.dart';
import '../widgets/category_chart.dart';
import '../widgets/recent_orders_table.dart';
import '../widgets/top_categories.dart';
import '../models/categories.dart';
import 'fl_chart_page.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String currentPage = 'dashboard';

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"name": "Electronics", "count": 12},
      {"name": "Clothing", "count": 8},
      {"name": "Home & Kitchen", "count": 5},
      {"name": "Books", "count": 3},
      {"name": "Toys", "count": 7},
      {"name": "Sports", "count": 4},
    ];
    final String role =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'UNKNOWN';

    void onMenuItemSelected(String page) {
      if (page == 'logout') {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        setState(() {
          currentPage = page;
        });
      }
      Navigator.pop(context); // close drawer on menu select
    }

    return Scaffold(
      appBar: AppBar(title: Text("$role"), backgroundColor: Colors.purple),
      drawer: SideMenu(role: role, onItemSelected: onMenuItemSelected),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: currentPage == 'dashboard'
            ? ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OverviewCard(
                          title: 'Revenue',
                          value: '₹5,180',
                          icon: Icons.attach_money,
                          color: Colors.green,
                          onTap: (){
                            Navigator.pushNamed(context, 'fl_chart');
                          },
                        ),
                      ),
                      Expanded(
                        child: OverviewCard(
                          title: 'Orders',
                          value: '7',
                          icon: Icons.shopping_cart,
                          color: Colors.orange,
                          onTap: (){
                            Navigator.pushNamed(context, '/orders');
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OverviewCard(
                          title: 'Products',
                          value: '28',
                          icon: Icons.inventory,
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        child: OverviewCard(
                          title: 'Categories',
                          value: '7',
                          icon: Icons.category,
                          color: Colors.blue,
                          onTap: () => Navigator.pushNamed(context, '/categories'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FlChartPage()),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "FL Charts",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TopCategories(categories: categories),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: RecentOrdersTable(
                        orders: [
                          {
                            "id": "1001",
                            "customer": "Alice",
                            "date": "2024-10-01",
                            "status": "Delivered",
                            "total": "₹250",
                          },
                          {
                            "id": "1002",
                            "customer": "Bob",
                            "date": "2024-10-02",
                            "status": "Pending",
                            "total": "₹150",
                          },
                          {
                            "id": "1003",
                            "customer": "Charlie",
                            "date": "2024-10-03",
                            "status": "Shipped",
                            "total": "₹300",
                          },
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'This is the $currentPage page.',
                  style: const TextStyle(fontSize: 22),
                ),
              ),
      ),
    );
  }
}
