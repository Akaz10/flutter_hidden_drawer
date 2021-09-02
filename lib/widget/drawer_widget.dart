import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/data/drawer_items.dart';
import 'package:flutter_hidden_drawer/model/drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({Key? key, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDrawerItems(context),
        ],
      ),
    );
  }
  Widget buildDrawerItems(BuildContext context) => Column(
    children: DrawerItems.all.map((item) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: Icon(item.icon, color: Colors.white,),
      title: Text(item.title,style: TextStyle(color: Colors.white, fontSize: 18),),
      onTap: () => onSelectedItem(item),
    )).toList(),
  );
}
