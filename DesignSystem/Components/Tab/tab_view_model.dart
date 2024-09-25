import 'package:flutter/material.dart';

class TabViewModel {
  final List<Tab> tabs;
  final Function(int)? onIndexChanged;
  final int initialIndex;

  TabViewModel({
    required this.initialIndex,
    required this.tabs, 
    this.onIndexChanged});
}
