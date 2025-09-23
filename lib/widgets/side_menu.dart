import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final String role;
  final Function(String) onItemSelected;

  SideMenu({required this.role, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Custom header instead of UserAccountsDrawerHeader
          Container(
            color: Colors.purple,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Text(
                    role.isNotEmpty
                        ? role[0]
                        : 'U', // First letter or fallback 'U'
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin User', // You can replace with dynamic display name if needed
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      role.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Menu Items
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => onItemSelected('dashboard'),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () => onItemSelected('Categories'),
          ),
          ListTile(
            leading: Icon(Icons.storefront),
            title: Text('Vendors'),
            onTap: () => onItemSelected('Vendors'),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Order List'),
            onTap: () => onItemSelected('Order List'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment_History'),
            onTap: () => onItemSelected('Payment History'),
          ),
          ListTile(
            leading: Icon(Icons.place),
            title: Text('Addresses'),
            onTap: () => onItemSelected('Addresses'),
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () => onItemSelected('Setting'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => onItemSelected('logout'),
          ),
        ],
      ),
    );
  }
}
