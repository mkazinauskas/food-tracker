import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  DiaryScreen({Key key}) : super(key: key);

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Diary screen')
    );
  }
}
