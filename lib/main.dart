import 'package:flutter/material.dart';
import 'package:foodtracker/menu_widget.dart';

void main() {
  runApp(FoodTrackerApp());
}

class FoodTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MenuWidget(),
    );
  }
}

