import 'package:flutter/material.dart';
import 'package:foodtracker/ui/navigation_bar.dart';

class SettingsScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/settings';

  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Center(child: Text('Settings screen')),
        bottomNavigationBar:
            NavigationBar(currentScreen: SettingsScreen.ROUTE_NAME));
  }
}
