import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/assets/constants.dart';
import 'package:whatsapp_clone/components/custom_appbar.dart';

class ChatSearch extends StatefulWidget {
  static const String id = '/chatsearch';
  const ChatSearch({Key? key}) : super(key: key);

  @override
  State<ChatSearch> createState() => _ChatSearchState();
}

class _ChatSearchState extends State<ChatSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010101),
      appBar: CustomAppBar(
        appBar: AppBar(
          backgroundColor: Color(0xFF0e0e0e),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
          ],
          title: Hero(
            tag: 'chatsearch',
            child: CupertinoTheme(
              data: CupertinoThemeData(brightness: Brightness.dark),
              child: CupertinoSearchTextField(
                autofocus: true,
              ),
            ),
          ),
        ),
        onTap: () {},
      ),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            horizontalTitleGap: 4.0,
            leading: Icon(
              CupertinoIcons.camera,
              color: kLightBlue,
            ),
            title: Text(
              'Photos',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.arrow_up_left_circle,
              color: Colors.grey,
              size: 20.0,
            ),
          ),
          ListTile(
            horizontalTitleGap: 4.0,
            leading: Icon(
              CupertinoIcons.photo_on_rectangle,
              color: kLightBlue,
            ),
            title: Text(
              'GIFs',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.arrow_up_left_circle,
              color: Colors.grey,
              size: 20.0,
            ),
          ),
          ListTile(
            horizontalTitleGap: 4.0,
            leading: Icon(
              CupertinoIcons.compass,
              color: kLightBlue,
            ),
            title: Text(
              'Links',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.arrow_up_left_circle,
              color: Colors.grey,
              size: 20.0,
            ),
          ),
          ListTile(
            horizontalTitleGap: 4.0,
            leading: Icon(
              CupertinoIcons.video_camera,
              color: kLightBlue,
            ),
            title: Text(
              'Videos',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.arrow_up_left_circle,
              color: Colors.grey,
              size: 20.0,
            ),
          ),
          ListTile(
            horizontalTitleGap: 4.0,
            leading: Icon(
              CupertinoIcons.book,
              color: kLightBlue,
            ),
            title: Text(
              'Documents',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.arrow_up_left_circle,
              color: Colors.grey,
              size: 20.0,
            ),
          ),
          ListTile(
            horizontalTitleGap: 4.0,
            leading: Icon(
              CupertinoIcons.music_note_2,
              color: kLightBlue,
            ),
            title: Text(
              'Audio',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.arrow_up_left_circle,
              color: Colors.grey,
              size: 20.0,
            ),
          )
        ]).toList(),
      ),
    );
  }
}
