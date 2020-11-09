import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/main.dart';
import 'package:foodtracker/ui/navigation_bar.dart';
import 'package:foodtracker/ui/screens/addnew/take_picture_screen.dart';

class AddNewScreen extends StatefulWidget {
  final CameraDescription firstCamera;

  AddNewScreen({Key key, @required this.firstCamera}) : super(key: key);

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  bool _photoTaken = false;
  bool _descriptionAdded = false;

  void _onTakePhoto () {
    setState(() {
      _photoTaken = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!_photoTaken){
      return TakePictureScreen(camera: widget.firstCamera, callback: _onTakePhoto);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New'),
        ),
        body:  Center(
            child: Column(
              children: [
                Text('Add New screen'),
              ],
            )),
        bottomNavigationBar: NavigationBar(currentScreen: Routes.ADD_NEW),
    );








  }
}
