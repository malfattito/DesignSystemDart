// sample_screen.dart
import 'package:flutter/material.dart';
import '../Components/NavBar/nav_bar.dart';

class NavBarSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Bar Sample Screen'),
      ),
      body: CustomNavbar(),
    );
  }
}