import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/ui/screens/addnew/add_new_screen.dart';
import 'package:foodtracker/ui/screens/addnew/photo_preview.dart';
import 'package:foodtracker/ui/screens/diary_screen.dart';
import 'package:foodtracker/ui/screens/info_screen.dart';

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
      initialRoute: Routes.DIARY,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        Routes.DIARY: (context) => DiaryScreen(),
        Routes.ADD_NEW: (context) => AddNewScreen(firstCamera: _cameraDescription),
        Routes.INFO: (context) => InfoScreen(),
        Routes.ADD_NEW_PHOTO_PREVIEW: (context) => PhotoPreview()
      },
    );
  }
}

class Routes {
  static const String DIARY = '/diary';
  static const String ADD_NEW = '/add-new';
  static const String ADD_NEW_PHOTO_PREVIEW = '/add-new/photo-preview';
  static const String INFO = '/info';
}
