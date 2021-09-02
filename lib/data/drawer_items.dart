import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/model/drawer_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItems{
  static const home = DrawerItem(title: 'Home', icon: FontAwesomeIcons.home);
  static const explore = DrawerItem(title: 'Explore', icon: Icons.explore);
  static const favorites = DrawerItem(title: 'Favorites', icon: Icons.favorite);
  static const messages = DrawerItem(title: 'Messages', icon: Icons.mail);
  static const profile = DrawerItem(title: 'Profile', icon: FontAwesomeIcons.userAlt);
  static const settings = DrawerItem(title: 'Settings', icon: Icons.settings);
  static const logout = DrawerItem(title: 'Logout', icon: Icons.logout);

  static final List<DrawerItem> all = [
    home,
    explore,
    favorites,
    messages,
    profile,
    settings,
    logout,
  ];
}