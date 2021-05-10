import 'package:beanies/data/repositories/hive_setup.dart';
import 'package:beanies/views/screens/dashboard_view.dart';
import 'package:flutter/material.dart';

void main() async {
  await initializeHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}
