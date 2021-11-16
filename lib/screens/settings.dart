import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  final ScrollController controller = ScrollController();
  bool titleVisibility = false;
  bool listTitleVisibility = true;
  late AnimationController colorController;
  late Animation appBarColor;
  Color appBarColorValue = Color(0xFF010101);

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
    controller.dispose();
    colorController.dispose();
    super.dispose();
  }

  void listenScrolling() {
    final scrollPosition = controller.offset;

    colorController.animateTo(scrollPosition / 65);
    setState(() {
      appBarColorValue = appBarColor.value;
    });

    if (scrollPosition >= 28.0) {
      if (titleVisibility != true && listTitleVisibility != false) {
        setState(() {
          titleVisibility = true;
          listTitleVisibility = false;
        });
      }
    } else if (titleVisibility == true && listTitleVisibility == false) {
      setState(() {
        titleVisibility = false;
        listTitleVisibility = true;
      });
    }
  }

  void listenColorScroll() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010101),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarColorValue,
        title: Visibility(
          visible: titleVisibility,
          child: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(),
          ),
          SliverAppBar(
            backgroundColor: Color(0xFF010101),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Visibility(
                  visible: listTitleVisibility,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 15.0),
          //     child: Text(
          //       'Settings',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 30.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListTile(
                horizontalTitleGap: 12.0,
                tileColor: Color(0xFF1C1C1E),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/60335881_2140310806016670_3747567555141697536_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=7206a8&_nc_ohc=Z1jKtjCCNgwAX_dmgT5&tn=wfPvW8tgETo93Trs&_nc_ht=scontent.fbki2-1.fna&oh=0165453776c5215d446d944fc6a80649&oe=61A2BD40",
                  ),
                  radius: 25.0,
                ),
                title: Text(
                  'Sean',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  'Fluttering',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 17.0,
                  backgroundColor: Color(0xFF2C2C2E),
                  child: Icon(
                    CupertinoIcons.qrcode,
                    color: Color(0xFF319FFC),
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            sliver: SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: ListTile(
                      dense: true,
                      minLeadingWidth: 10.0,
                      visualDensity: VisualDensity.compact,
                      tileColor: Color(0xFF1C1C1E),
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC500),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      title: Text(
                        'Starred Messages',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 10.0,
                    visualDensity: VisualDensity.compact,
                    tileColor: Color(0xFF1C1C1E),
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF17AC9B),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.laptop,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    title: Text(
                      'Linked Devices',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              itemExtent: 40.0,
            ),
            padding: EdgeInsets.only(top: 30.0),
          ),
          SliverPadding(
            sliver: SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: ListTile(
                      dense: true,
                      minLeadingWidth: 10.0,
                      visualDensity: VisualDensity.compact,
                      tileColor: Color(0xFF1C1C1E),
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF017BF9),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(3.0),
                        child: Transform.rotate(
                          angle: 90 * math.pi / 180,
                          child: Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                      title: Text(
                        'Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      dense: true,
                      minLeadingWidth: 10.0,
                      visualDensity: VisualDensity.compact,
                      tileColor: Color(0xFF1C1C1E),
                      leading: Container(
                        width: 26.0,
                        height: 26.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(3.0),
                        child: FlutterLogo(),
                      ),
                      title: Text(
                        'Chats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      dense: true,
                      minLeadingWidth: 10.0,
                      visualDensity: VisualDensity.compact,
                      tileColor: Color(0xFF1C1C1E),
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF8402F),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(3.0),
                        child: Transform.rotate(
                          angle: 90 * math.pi / 180,
                          child: Icon(
                            Icons.edit_notifications_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                      title: Text(
                        'Notifications',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 10.0,
                    visualDensity: VisualDensity.compact,
                    tileColor: Color(0xFF1C1C1E),
                    leading: Container(
                      height: 26.0,
                      width: 26.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF33C65D),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        CupertinoIcons.arrow_up_arrow_down,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    title: Text(
                      'Storage and Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              itemExtent: 40.0,
            ),
            padding: EdgeInsets.only(top: 30.0),
          ),
          SliverPadding(
            sliver: SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: ListTile(
                      dense: true,
                      minLeadingWidth: 10.0,
                      visualDensity: VisualDensity.compact,
                      tileColor: Color(0xFF1C1C1E),
                      leading: Container(
                        width: 26.0,
                        height: 26.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF017AFC),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'i',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 10.0,
                    visualDensity: VisualDensity.compact,
                    tileColor: Color(0xFF1C1C1E),
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF92D56),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    title: Text(
                      'Tell a Friend',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              itemExtent: 40.0,
            ),
            padding: EdgeInsets.only(top: 30.0),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 30.0),
            sliver: SliverFixedExtentList(
              itemExtent: 40.0,
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Text(
                        'from',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'F L U T T E R',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}
