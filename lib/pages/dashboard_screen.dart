import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import '../widgets/overview_card.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String currentPage = 'dashboard';

  @override
  Widget build(BuildContext context) {
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
                          icon: Icons.attach_money, // ✅ new icon
                          color: Colors.green, // ✅ icon color
                        ),
                      ),
                      Expanded(
                        child: OverviewCard(
                          title: 'Orders',
                          value: '7',
                          icon: Icons.shopping_cart,
                          color: Colors.orange,
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Revenue trend graph placeholder'),
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Top categories chart placeholder'),
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Recent orders list placeholder'),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'This is the $currentPage page.',
                  style: TextStyle(fontSize: 22),
                ),
              ),
      ),
    );
  }
}
