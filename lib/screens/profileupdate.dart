import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/assets/constants.dart';

class ProfileUpdateScreen extends StatelessWidget {
  static const String id = '/profileupdate';
  const ProfileUpdateScreen({Key? key}) : super(key: key);

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
            'Edit Profile',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xFFa1c1c1e),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 20.0, right: 20.0, bottom: 40.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 28.0,
                          child: CircleAvatar(
                            radius: 27.5,
                            backgroundColor: Color(0xFFa1c1c1e),
                            child: Text(
                              'add photo',
                              style:
                                  TextStyle(color: kLightBlue, fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 50.0, bottom: 20.0),
                          child: Text(
                            'Enter your name and add an optional profile picture',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                    indent: 20.0,
                  ),
                  Container(
                    height: 25.0,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      cursorColor: kLightBlue,
                      initialValue: 'Sean',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                    indent: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 30.0, bottom: 5.0),
              child: Text(
                'PHONE NUMBER',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              color: Color(0xFFa1c1c1e),
              child: Text(
                '+60 11-234 5678',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 30.0, bottom: 5.0),
              child: Text(
                'ABOUT',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              color: Color(0xFFa1c1c1e),
              child: Row(
                children: [
                  Text(
                    'Fluttering',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.grey,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
