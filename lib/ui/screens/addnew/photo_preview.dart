import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoPreview extends StatelessWidget {
  PhotoPreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreviewablePhoto photo = ModalRoute.of(context).settings.arguments;

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

class PreviewablePhoto {
  final String path;

  PreviewablePhoto(@required this.path);
}
