import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/ui/screens/addnew/add_new_screen.dart';
import 'package:foodtracker/ui/screens/addnew/photo_preview.dart';
import 'package:foodtracker/ui/screens/diary_screen.dart';
import 'package:foodtracker/ui/screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(FoodTrackerApp(firstCamera));
}

class FoodTrackerApp extends StatelessWidget {
  final CameraDescription _cameraDescription;

  FoodTrackerApp(@required this._cameraDescription);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: DiaryScreen.ROUTE_NAME,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        DiaryScreen.ROUTE_NAME: (context) => DiaryScreen(),
        AddNewScreen.ROUTE_NAME: (context) =>
            AddNewScreen(firstCamera: _cameraDescription),
        SettingsScreen.ROUTE_NAME: (context) => SettingsScreen(),
        PhotoPreview.ROUTE_NAME: (context) => PhotoPreview()
      },
    );
  }
}

class Routes {
  static const String INFO = '/info';
}
