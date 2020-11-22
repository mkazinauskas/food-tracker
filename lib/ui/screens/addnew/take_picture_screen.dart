import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/ui/navigation_bar.dart';
import 'package:foodtracker/ui/screens/addnew/add_new_screen.dart';
import 'package:foodtracker/ui/screens/addnew/photo_path.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TakePictureScreen extends StatefulWidget {

  static const String ROUTE_NAME = '/add-new/take-picture';

  TakePictureScreen({Key key}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  Future<CameraDescription> _cameraDescription;
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraDescription = _initCameraDescription();
    _cameraDescription.then((readyCamera) {
      _controller = CameraController(
        readyCamera,
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  Future<CameraDescription> _initCameraDescription() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    return Future.value(cameras.first);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Photo'),
      ),
      body: _buildBody(context),
      bottomNavigationBar:
      NavigationBar(currentScreen: AddNewScreen.ROUTE_NAME),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the path
            // package.
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            try {
              // Attempt to take a picture and log where it's been saved.
              await _controller.takePicture(path);
            } catch (e) {
              print(e);
            }
            Navigator.pop(context, PhotoPath(path));
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder<void>(
        future: _cameraDescription,
        builder: (context, cameraSnapshot) {
          if (cameraSnapshot.connectionState != ConnectionState.done) {
            return _loadingIndicator();
          } else {
            return FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  return _loadingIndicator();
                }
              },
            );
          }
        }
    );
  }

  Widget _loadingIndicator() {
    return Center(child: CircularProgressIndicator());
  }
}
