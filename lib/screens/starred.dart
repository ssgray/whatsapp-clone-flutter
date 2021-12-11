import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/assets/constants.dart';

class StarredScreen extends StatelessWidget {
  static const String id = '/starred';
  const StarredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey,
        appBar: AppBar(
          leadingWidth: 110.0,
          centerTitle: true,
          backgroundColor: Color(0xFF121212),
          elevation: 0,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.left_chevron,
                    size: 20.0,
                    color: kLightBlue,
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Hero(
                    tag: 'settings',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          color: kLightBlue,
                          fontSize: 16.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Starred Messages',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60.0,
              child: FlutterLogo(
                size: 80.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'No Starred Messages',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Tap and hold on any message to star it, so you can easily find it later.',
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
