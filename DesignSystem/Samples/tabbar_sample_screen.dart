import 'package:flutter/material.dart';
import '../Components/TabBar/tabbar.dart';
import '../Components/TabBar/tabbar_view_model.dart';

class TabBarSampleScreen extends StatefulWidget {
  @override
  _TabBarSampleScreenState createState() => _TabBarSampleScreenState();
}

class _TabBarSampleScreenState extends State<TabBarSampleScreen> {
  String _selectedTabText = "Select a tab";

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabText = "Selected Tab: Tab ${index + 1}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTabBar.instantiate(
              TabBarViewModel(
                tabTitles: ["Tab 1", "Tab 2", "Tab 3"],
              ),
              _onTabSelected,
            ),
            SizedBox(height: 20),
            Text(
              _selectedTabText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}