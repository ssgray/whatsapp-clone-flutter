import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/bottom_navigation_icons_icons.dart';
import 'package:whatsapp_clone/screens/chats.dart';
import 'package:whatsapp_clone/screens/settings.dart';
import 'package:whatsapp_clone/screens/status.dart';
import 'calls.dart';
import 'camera.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _Chats();
}

class _Chats extends State<Navigation> with SingleTickerProviderStateMixin {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 7.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF3C9EF6),
                        radius: 3.0,
                      ),
                      right: 0.0,
                      top: -2.0,
                    ),
                    Icon(
                      BottomNavigationIcons.spin1,
                      size: 22,
                    )
                  ],
                ),
              ),
              label: 'Status',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Icon(
                    CupertinoIcons.phone_fill,
                    size: 26.0,
                  ),
                ),
                label: 'Calls'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Icon(
                    CupertinoIcons.camera,
                    size: 26,
                  ),
                ),
                label: 'Camera'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        CupertinoIcons.chat_bubble_2_fill,
                        size: 26,
                      ),
                      Positioned(
                        right: -15,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 15,
                            minHeight: 15,
                          ),
                          child: Text(
                            '200',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                label: 'Chats'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Icon(
                    CupertinoIcons.settings,
                    size: 26,
                  ),
                ),
                label: 'Settings')
          ],
          selectedItemColor: Color(0xFF33A0FF),
          unselectedItemColor: Color(0xFF727272),
          unselectedFontSize: 10.0,
          selectedFontSize: 10.0,
          backgroundColor: Color(0xFF171717),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          enableFeedback: false,
          iconSize: 20.0,
        ),
      ),
      body: Center(
        child: [
          Status(),
          Calls(),
          Camera(),
          Chats(),
          Settings(),
        ].elementAt(_selectedIndex),
      ),
      backgroundColor: Color(0xFF010101),
    );
  }
}
