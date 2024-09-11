import 'package:flutter/material.dart';

const bottomTabs = [
  {
    "index": "0",
    "label": "Home",
    IconData: Icons.home
  },
  {
    "index": "1",
    "label": "Messages",
    IconData: Icons.messenger
  },
  {
    "index": "2",
    "label": "Label",
    IconData: Icons.label
  },
  {
    "index": "3",
    "label": "Profile",
    IconData: Icons.person
  },
];

class BottomTabBarViewModel {
  final Function(int)? onIndexChanged;
  final int initialIndex;

  BottomTabBarViewModel({
    required this.initialIndex, 
    this.onIndexChanged
  });
}