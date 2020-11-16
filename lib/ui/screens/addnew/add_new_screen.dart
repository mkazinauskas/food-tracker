import 'dart:io';
import 'package:camera/camera.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  String _imagePath = '';
  bool _descriptionAdded = false;
  DateTime date = DateTime.now();

  void _onTakePhoto(@required imagePath) {
    setState(() {
      _photoTaken = true;
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_photoTaken) {
      return TakePictureScreen(
          camera: widget.firstCamera, callback: _onTakePhoto);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                _buildFoodPhoto(constraints),
                _buildDateField(),
                _buildTimeField(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(currentScreen: Routes.ADD_NEW),
    );
  }

  Widget _buildDateField() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: DateTimeField(
        label: 'At what day did you eat?',
        selectedDate: date,
        mode: DateFieldPickerMode.date,
        initialDatePickerMode: DatePickerMode.day,
        onDateSelected: (DateTime selectedDate) {
          setState(() {
            date = selectedDate;
          });
        },
        lastDate: DateTime.now(),
      ),
    );
  }

  Widget _buildTimeField() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: DateTimeField(
        label: 'At what time did you eat?',
        selectedDate: date,
        mode: DateFieldPickerMode.time,
        initialDatePickerMode: DatePickerMode.day,
        onDateSelected: (DateTime selectedDate) {
          setState(() {
            date = selectedDate;
          });
        },
        lastDate: DateTime.now(),
      ),
    );
  }

  Widget _buildFoodPhoto(BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: GestureDetector(
          onTap: () {
            setState(() {
              _photoTaken = false;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.file(
              File(_imagePath),
              height: constraints.maxHeight / 2,
            ),
          )),
    );
  }
}
