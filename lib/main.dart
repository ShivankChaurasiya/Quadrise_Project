import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_screen.dart';
import 'pages/fl_chart_page.dart';
import 'pages/orders_page.dart';
import 'pages/categories_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Role Based Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardScreen(),
        '/fl_chart_page': (context) => FlChartPage(),
        '/orders': (context) => OrdersPage(),
        '/categories': (context) => CategoriesPage(),
      },
    );
  }
}
