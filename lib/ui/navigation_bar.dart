import 'package:flutter/material.dart';
import 'package:foodtracker/main.dart';

class NavigationBar extends StatefulWidget {

  final String currentScreen;

  NavigationBar({Key key, @required this.currentScreen}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<String> _routes = [Routes.DIARY, Routes.ADD_NEW, Routes.INFO];

  void _onItemTapped(int index) {
    Navigator.pushReplacementNamed(context, _routes.elementAt(index));
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
          icon: Icon(Icons.add, size: 40),
          label: 'Add New',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info',
        ),
      ],
      currentIndex: _routes.indexOf(widget.currentScreen),
      onTap: _onItemTapped,
    );
  }
}
