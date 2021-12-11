import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/assets/constants.dart';
import 'package:whatsapp_clone/components/custom_appbar.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> with SingleTickerProviderStateMixin {
  final ScrollController controller = ScrollController();
  bool titleVisibility = false;
  Color appBarColorValue = Color(0xFF010101);
  late AnimationController colorController;
  late Animation appBarColor;

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
    controller.dispose();
    colorController.dispose();
  }

  void listenScrolling() {
    final scrollPosition = controller.offset;

    colorController.animateTo(scrollPosition / 80);
    setState(() {
      appBarColorValue = appBarColor.value;
    });

    if (scrollPosition >= 80) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010101),
      appBar: CustomAppBar(
        appBar: AppBar(
          leadingWidth: 80.0,
          centerTitle: true,
          backgroundColor: appBarColorValue,
          elevation: 0,
          leading: TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: Text(
                'Privacy',
                style: TextStyle(
                  color: kLightBlue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Visibility(
              visible: titleVisibility,
              child: Text(
                'Status',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        onTap: () {},
      ),
      body: CustomScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(),
          ),
          SliverAppBar(
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                'Status',
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: ListTile(
                horizontalTitleGap: 12.0,
                tileColor: Color(0xFF1C1C1E),
                leading: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(dummyChatsData[0].avatarUrl),
                      radius: 25.0,
                    ),
                    Positioned(
                      right: 0,
                      bottom: -2,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF319FFC),
                        radius: 8.0,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    )
                  ],
                ),
                title: Text(
                  'My Status',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Add to my status',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF2C2C2E),
                      child: Icon(
                        CupertinoIcons.camera_fill,
                        color: Color(0xFF319FFC),
                        size: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xFF2C2C2E),
                      child: Icon(
                        CupertinoIcons.pen,
                        color: Color(0xFF319FFC),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 40.0),
              child: Text(
                'VIEWED UPDATES',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ListTile(
                horizontalTitleGap: 12.0,
                tileColor: Color(0xFF1C1C1E),
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Color(0xFF616161),
                      child: CircleAvatar(
                        radius: 24.0,
                        backgroundColor: Color(0xFF010101),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/51442644_2107722085956424_8173265344870219776_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GYV2YSdnTA4AX_MuRYI&_nc_ht=scontent.fbki2-1.fna&oh=081a898b6bc344b658748792df229457&oe=61A4A62E",
                          ),
                          radius: 23.0,
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  'Ting',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '18h ago',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
