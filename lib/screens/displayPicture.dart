import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 40.0,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(
            CupertinoIcons.xmark,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            children: [
              Icon(CupertinoIcons.moon_fill),
              SizedBox(
                width: 20.0,
              ),
              Icon(CupertinoIcons.bolt_slash_fill),
              SizedBox(
                width: 20.0,
              )
            ],
          )
        ],
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(
        File(imagePath),
        width: size,
        // height: size / 0.4,
      ),
    );
  }
}
