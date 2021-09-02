import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/widget/drawer_menu_widget.dart';

class HomePage extends StatelessWidget {

  final VoidCallback openDrawer;

  const HomePage({
    Key? key,
    required this.openDrawer,
}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: DrawerMenuWidget(onClicked: openDrawer,),
        title: Text("Home Page"),
      ),
      body: Center(child: Text("DENEME"),),
    );
  }
}
