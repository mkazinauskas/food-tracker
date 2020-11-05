import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  AddNewScreen({Key key}) : super(key: key);

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Add New screen')
    );
  }
}
