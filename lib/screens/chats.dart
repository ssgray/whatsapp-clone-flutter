import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/components/custom_appbar.dart';
import '../chat_icons_icons.dart';
import 'package:whatsapp_clone/components/my_behavior.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  // int index = 0;
  final ScrollController controller = ScrollController();
  bool archivedOffstage = true;

  void listenScrolling() {
    if (controller.offset <= -30.0) {
      setState(() {
        archivedOffstage = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(listenScrolling);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.removeListener(listenScrolling);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010101),
      appBar: CustomAppBar(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Chats'),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF010101),
          elevation: 0.0,
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Edit',
                style: TextStyle(color: Color(0xFF3175AE), fontSize: 16.0),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 20.0),
                child: Icon(
                  ChatIcons.edit,
                  color: Color(0xFF3175AE),
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          controller.animateTo(0,
              duration: Duration(milliseconds: 100), curve: Curves.easeIn);
        },
      ),
      body: CustomScrollView(
        // scrollBehavior: MyBehavior(),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        controller: controller,
        slivers: [
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 15.0),
          //     child: Text(
          //       'Chats',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 30.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: SizedBox(),
          ),
          SliverAppBar(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                'Chats',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Color(0xFF010101),
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 50.0, bottom: 15.0),
                child: CupertinoSearchTextField(
                  backgroundColor: Color(0xFF1D1D1F),
                ),
              ),
            ),
          ),
          // SliverAppBar(
          //   backgroundColor: Colors.white,
          //   flexibleSpace: FlexibleSpaceBar(
          //     background: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 15.0),
          //           child: Row(
          //             children: [
          //               CircleAvatar(
          //                 child: Icon(
          //                   CupertinoIcons.archivebox_fill,
          //                   color: Color(0xFF3C9EF6),
          //                   size: 20.0,
          //                 ),
          //                 backgroundColor: Color(0xFF1D1D1F),
          //                 radius: 15.0,
          //               ),
          //               SizedBox(
          //                 width: 7.0,
          //               ),
          //               Text(
          //                 'Archived Chats',
          //                 style: TextStyle(
          //                   color: Color(0xFF3C9EF6),
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Text(
          //                   '0',
          //                   style: TextStyle(
          //                     color: Color(0xFF7C7B84),
          //                   ),
          //                   textAlign: TextAlign.right,
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 10.0,
          //               )
          //             ],
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 5.0),
          //           child: Divider(
          //             height: 8.0,
          //             color: Color(0xFF7C7B84),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          CupertinoIcons.archivebox_fill,
                          color: Color(0xFF3C9EF6),
                          size: 20.0,
                        ),
                        backgroundColor: Color(0xFF1D1D1F),
                        radius: 15.0,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        'Archived Chats',
                        style: TextStyle(
                          color: Color(0xFF3C9EF6),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: Color(0xFF7C7B84),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Divider(
                    height: 8.0,
                    color: Color(0xFF7C7B84),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Broadcast Lists',
                        style: TextStyle(
                          color: Color(0xFF3C9EF6),
                        ),
                      ),
                      Text(
                        'New Group',
                        style: TextStyle(
                          color: Color(0xFF3C9EF6),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Divider(
                    height: 8.0,
                    color: Color(0xFF7C7B84),
                  ),
                )
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 80.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          NetworkImage(dummyChatsData[index].avatarUrl),
                      radius: 25.0,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          dummyChatsData[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE9E9E9),
                          ),
                        ),
                        Text(
                          dummyChatsData[index].time,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: dummyChatsData[index].time.endsWith('M')
                                ? Color(0xFF3C9EF6)
                                : Color(0xFF79787B),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(dummyChatsData[index].message,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF7C7B84),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        if (dummyChatsData[index].muteStatus == true)
                          Icon(
                            CupertinoIcons.speaker_slash_fill,
                            color: Color(0xFF7C7B84),
                            size: 15.0,
                          ),
                        if (dummyChatsData[index].notificationNumber != "0")
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFF3C9EF6),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 1.0),
                                child: Text(
                                  dummyChatsData[index].notificationNumber,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 83.0, right: 5),
                    child: Divider(
                      height: 8.0,
                      color: Color(0xFF7C7B84),
                    ),
                  ),
                ],
              );
            }, childCount: dummyChatsData.length),
          )
        ],
      ),
    );
  }
}
