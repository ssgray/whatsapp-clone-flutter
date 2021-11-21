import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/components/custom_appbar.dart';
import '../chat_icons_icons.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> with SingleTickerProviderStateMixin {
  // int index = 0;
  final ScrollController controller = ScrollController();
  bool titleVisibility = false;
  Color appBarColorValue = Color(0xFF010101);
  late AnimationController colorController;
  late Animation appBarColor;

  void listenScrolling() {
    final scrollPosition = controller.offset;

    colorController.animateTo(scrollPosition / 100);
    setState(() {
      appBarColorValue = appBarColor.value;
    });

    if (scrollPosition >= 80.5) {
      if (titleVisibility != true) {
        setState(() {
          titleVisibility = true;
        });
      }
    } else if (titleVisibility != false) {
      setState(() {
        titleVisibility = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(listenScrolling);
    colorController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 0,
      ),
    );

    appBarColor = ColorTween(
      begin: Color(0xFF010101),
      end: Color(0xFF121212),
    ).animate(colorController);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    colorController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010101),
      appBar: CustomAppBar(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Visibility(
              child: Text('Chats'),
              visible: titleVisibility,
            ),
          ),
          centerTitle: true,
          backgroundColor: appBarColorValue,
          elevation: 0.0,
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
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
            centerTitle: false,
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
            backgroundColor: appBarColorValue,
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
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
                        width: 5.0,
                      )
                    ],
                  ),
                  Divider(
                    height: 8.0,
                    color: Color(0xFF7C7B84),
                    thickness: 0.2,
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                  Divider(
                    height: 8.0,
                    color: Color(0xFF7C7B84),
                    thickness: 0.2,
                  )
                ],
              ),
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
                      radius: 30.0,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          dummyChatsData[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                            color: Color(0xFFE9E9E9),
                          ),
                        ),
                        Text(
                          dummyChatsData[index].time,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
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
                                  fontSize: 15.0,
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
                            size: 17.0,
                          ),
                        if (dummyChatsData[index].notificationNumber != "0")
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFF3C9EF6),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  dummyChatsData[index].notificationNumber,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Color(0xFF7C7B84),
                    thickness: 0.2,
                    indent: 83.0,
                    endIndent: 5.0,
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
