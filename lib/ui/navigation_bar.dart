import 'package:flutter/material.dart';
import 'package:foodtracker/main.dart';
import 'package:foodtracker/ui/screens/addnew/add_new_screen.dart';
import 'package:foodtracker/ui/screens/diary_screen.dart';
import 'package:foodtracker/ui/screens/settings_screen.dart';

class NavigationBar extends StatefulWidget {
  final String currentScreen;

  NavigationBar({Key key, @required this.currentScreen}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<String> _routes = [
    DiaryScreen.ROUTE_NAME,
    AddNewScreen.ROUTE_NAME,
    SettingsScreen.ROUTE_NAME
  ];

  void _onItemTapped(int index) {
    Navigator.pushNamedAndRemoveUntil(
        context, _routes.elementAt(index), ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Diary',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline, size: 40),
          label: 'Add New',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _routes.indexOf(widget.currentScreen),
      onTap: _onItemTapped,
    );
  }
}
