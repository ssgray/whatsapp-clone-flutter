import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera.dart';
import 'package:whatsapp_clone/screens/chatsearch.dart';
import 'package:whatsapp_clone/screens/message.dart';
import 'package:whatsapp_clone/screens/navigation.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/screens/profileupdate.dart';
import 'package:whatsapp_clone/screens/starred.dart';

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
      debugShowCheckedModeBanner: false,
      routes: {
        Navigation.id: (context) => const Navigation(),
        CameraScreen.id: (context) => CameraScreen(
              cameras: cameras,
            ),
        ProfileUpdateScreen.id: (context) => ProfileUpdateScreen(),
        StarredScreen.id: (context) => StarredScreen(),
        MessageScreen.id: (context) => MessageScreen(),
        ChatSearch.id: (context) => ChatSearch(),
      },
      initialRoute: Navigation.id,
    );
  }
}
