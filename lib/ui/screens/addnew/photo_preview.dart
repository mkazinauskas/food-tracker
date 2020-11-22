import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/ui/screens/addnew/photo_path.dart';

class PhotoPreview extends StatelessWidget {

  static const String ROUTE_NAME = '/add-new/photo-preview';

  PhotoPreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhotoPath photo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo preview'),
      ),
      body: Image.file(
        File(photo.path),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}