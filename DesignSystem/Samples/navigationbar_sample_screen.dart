import 'package:flutter/material.dart';
import '../Components/NavigationBar/navigationbar_view_model.dart';

class NavigationBarSampleScreen extends StatelessWidget {
  const NavigationBarSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBarScreen()
    );
  }
}