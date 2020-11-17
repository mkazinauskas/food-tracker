import 'dart:io';
import 'package:camera/camera.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodtracker/main.dart';
import 'package:foodtracker/ui/navigation_bar.dart';
import 'package:foodtracker/ui/screens/addnew/take_picture_screen.dart';

const double _DEFAULT_FIELD_PADDING = 15.0;

const List<String> _WHY_DID_YOU_EAT_OPTIONS = [
  'I am hungry',
  'I am upset',
  'I am bored',
  "I don't know"
];

class AddNewScreen extends StatefulWidget {
  final CameraDescription firstCamera;

  AddNewScreen({Key key, @required this.firstCamera}) : super(key: key);

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  bool _photoTaken = false;
  String _imagePath = '';
  DateTime date = DateTime.now();
  String _whyDidYouEat = _WHY_DID_YOU_EAT_OPTIONS.first;

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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          // Provide an onPressed callback.
          onPressed: () async {}),
      appBar: AppBar(
        title: const Text('Add New'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildFoodPhoto(constraints),
                  _buildDateField(),
                  _buildTimeField(),
                  _buildWhyDidYouEat(),
                  _buildAdditionalNotes()
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(currentScreen: Routes.ADD_NEW),
    );
  }

  Widget _buildFoodPhoto(BoxConstraints constraints) {
    double buttonWidth = constraints.maxWidth / 6;

    double maxImageSize = buttonWidth * 3;

    return Container(
      padding: const EdgeInsets.only(
          left: _DEFAULT_FIELD_PADDING, right: _DEFAULT_FIELD_PADDING),
      child: Card(
        child: Container(
          margin: const EdgeInsets.only(
              top: _DEFAULT_FIELD_PADDING, bottom: _DEFAULT_FIELD_PADDING),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildPhotoButton(
                  buttonWidth: buttonWidth,
                  tooltip: 'View photo',
                  icon: Icons.zoom_in,
                  onPressed: () {
                    setState(() {});
                  }),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: maxImageSize,
                  child: Image.file(
                    File(_imagePath),
                  ),
                ),
              ),
              _buildPhotoButton(
                  buttonWidth: buttonWidth,
                  tooltip: 'Retake photo',
                  icon: Icons.cached,
                  onPressed: () {
                    setState(() {
                      _photoTaken = false;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoButton({
    @required double buttonWidth,
    @required String tooltip,
    @required IconData icon,
    @required dynamic onPressed,
  }) {
    return Container(
      width: buttonWidth,
      child: Center(
        child: IconButton(
          padding: const EdgeInsets.all(_DEFAULT_FIELD_PADDING),
          iconSize: 40.0,
          icon: Icon(icon),
          tooltip: tooltip,
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Container(
      margin: EdgeInsets.only(
          left: _DEFAULT_FIELD_PADDING, right: _DEFAULT_FIELD_PADDING),
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
      margin: EdgeInsets.only(
          left: _DEFAULT_FIELD_PADDING, right: _DEFAULT_FIELD_PADDING),
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

  Widget _buildWhyDidYouEat() {
    return Container(
      margin: EdgeInsets.only(
          left: _DEFAULT_FIELD_PADDING, right: _DEFAULT_FIELD_PADDING),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: 'Why do I eat?'),
        isExpanded: true,
        value: _whyDidYouEat,
        hint: Text('Why did you eat?'),
        onChanged: (String newValue) {
          setState(() {
            _whyDidYouEat = newValue;
          });
        },
        items: _WHY_DID_YOU_EAT_OPTIONS
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAdditionalNotes() {
    return Container(
      margin: EdgeInsets.only(
          left: _DEFAULT_FIELD_PADDING, right: _DEFAULT_FIELD_PADDING),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          labelText: 'Notes (optional)',
        ),
      ),
    );
  }
}
