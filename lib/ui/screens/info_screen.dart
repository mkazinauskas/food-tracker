import 'package:flutter/material.dart';
import 'package:foodtracker/main.dart';
import 'package:foodtracker/ui/navigation_bar.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: Center(
          child: Text('Info screen')
      ),
      bottomNavigationBar: NavigationBar(currentScreen: Routes.INFO)
    );
  }
}
