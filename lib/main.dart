import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/ui/screens/addnew/add_new_screen.dart';
import 'package:foodtracker/ui/screens/addnew/photo_preview.dart';
import 'package:foodtracker/ui/screens/addnew/take_picture_screen.dart';
import 'package:foodtracker/ui/screens/diary_screen.dart';
import 'package:foodtracker/ui/screens/settings_screen.dart';

void main() async {
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
      initialRoute: DiaryScreen.ROUTE_NAME,
      routes: {
        DiaryScreen.ROUTE_NAME: (context) => DiaryScreen(),
        AddNewScreen.ROUTE_NAME: (context) => AddNewScreen(),
        SettingsScreen.ROUTE_NAME: (context) => SettingsScreen(),
        PhotoPreview.ROUTE_NAME: (context) => PhotoPreview(),
        TakePictureScreen.ROUTE_NAME: (context) => TakePictureScreen()
      },
    );
  }
}

class Routes {
  static const String INFO = '/info';
}
