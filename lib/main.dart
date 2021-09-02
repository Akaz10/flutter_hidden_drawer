import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/page_drawer/home_page.dart';
import 'package:flutter_hidden_drawer/widget/drawer_widget.dart';

import 'data/drawer_items.dart';
import 'model/drawer_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'title',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color.fromRGBO(21, 30, 61, 1),
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  bool isDragging = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 200;
        yOffset = 150;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            buildDrawer(),
            buildPage(),
          ],
        ));
  }

  Widget buildDrawer() => SafeArea(child: Container(
    width: xOffset,
    child: DrawerWidget(
          onSelectedItem: (item) {
            switch (item) {
              case DrawerItems.logout:
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logging Out")));
            }
            setState(() => this.item = item);
            closeDrawer();
          },
        ),
  ));

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();

          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
                absorbing: isDrawerOpen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                  child: Container(
                      color: isDrawerOpen
                          ? Colors.white12
                          : Theme.of(context).primaryColor,
                      child: getDrawerPage(),
                ))),
      ),
    )
    );
  }

  Widget getDrawerPage() {
    switch(item) {
  //    case DrawerItems.explore:
   //     return ExplorerPage(openDrawer: openDrawer);
        //.
        //.
      case DrawerItems.home:
      default:
        return HomePage(openDrawer: openDrawer);
    }
  }
}
