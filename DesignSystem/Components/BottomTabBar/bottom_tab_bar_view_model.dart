import 'package:flutter/material.dart';

class BottomTabBarViewModel {
  final Function(int)? onIndexChanged;
  final List<BottomNavigationBarItem> bottomTabs;

  BottomTabBarViewModel({
    required this.bottomTabs, 
    this.onIndexChanged
  });
}