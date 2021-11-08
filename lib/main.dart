import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = ThemeData();
    return const MaterialApp(
      title: 'WhatsApp',
      home: Navigation(),
    );
  }
}
