import 'package:flutter/material.dart';
import 'package:ntmu/Models/MenuItem.dart';

class popupMenu_opForum{
  static const List<MenuItem> menu_items = [
    itemEdit
  ];
  static const itemEdit = MenuItem(menuItem_icon: Icon(Icons.edit), menuItem_name: 'Edit Post');
  //static const itemShare = MenuItem(menuItem_icon: Icon(Icons.share_outlined), menuItem_name: 'Share')
}

class popupMenu_visitorForum{
  static const List<MenuItem> menu_items = [
    itemFlagpost
  ];
  static const itemFlagpost = MenuItem(menuItem_icon: Icon(Icons.flag_rounded), menuItem_name: 'Flag Post');
}