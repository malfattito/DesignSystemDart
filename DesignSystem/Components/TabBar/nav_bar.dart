// custom_navbar.dart
import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: TabBar(
              indicatorColor: Colors.yellow,
              indicatorWeight: 4.0,
              tabs: [
                Tab(text: "Tab 1"),
                Tab(text: "Tab 2"),
                Tab(text: "Tab 3"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}