import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/assets/constants.dart';
import 'package:whatsapp_clone/models/message_arguments.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class MessageScreen extends StatelessWidget {
  static const String id = '/message';

  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MessageArguments;
    // final bottomHeight = MediaQuery.of(context).padding.bottom;
    // print(bottomHeight);
    return Scaffold(
      backgroundColor: kDarkGrey,
      appBar: AppBar(
        leadingWidth: 80.0,
        centerTitle: true,
        backgroundColor: Color(0xFF121212),
        elevation: 0,
        titleSpacing: 0.0,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
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
                Text(
                  '200',
                  style: TextStyle(
                    color: kLightBlue,
                    fontSize: 16.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(args.urlAvatar),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                args.name,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Icon(
              CupertinoIcons.videocam,
              color: kLightBlue,
              size: 40.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Icon(
              CupertinoIcons.phone,
              color: kLightBlue,
              size: 25.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
                child: ListView(
                  children: [
                    ChatBubble(
                      clipper: ChatBubbleClipper8(
                          type: BubbleType.receiverBubble, radius: 15.0),
                      backGroundColor: Color(0xFF2a2a2b),
                      margin: EdgeInsets.all(5.0),
                      elevation: 0,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                          minWidth: MediaQuery.of(context).size.width * 0.3,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 2.0,
                            ),
                            Flexible(
                              child: Text(
                                args.message,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                args.messageTime,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  FocusScope.of(context).unfocus();
                }),
          ),
          Container(
            color: Color(0xFF121212),
            // height: 80.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(
                      CupertinoIcons.add,
                      color: kLightBlue,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.0, vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xFF2c2c2e),
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {},
                      suffix: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          Icons.sticky_note_2_rounded,
                          color: kLightBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(
                      CupertinoIcons.camera,
                      color: kLightBlue,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(
                      CupertinoIcons.mic,
                      color: kLightBlue,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
