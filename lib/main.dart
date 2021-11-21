import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera.dart';
import 'package:whatsapp_clone/screens/navigation.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  cameras = await availableCameras();
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'WhatsApp',
      routes: {
        Navigation.id: (context) => const Navigation(),
        CameraScreen.id: (context) => CameraScreen(
              cameras: cameras,
            ),
      },
      initialRoute: Navigation.id,
    );
  }
}
