import 'package:flutter/material.dart';

class CustomNavigationBarView extends StatelessWidget {
  const CustomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        Center(child: Text('Label', style: TextStyle(color: Colors.black))),
        Center(child: Text('Mensages', style: TextStyle(color: Colors.black))),
        Center(child: Text('Label', style: TextStyle(color: Colors.black))),
        Center(child: Text('Profile', style: TextStyle(color: Colors.black)))
      ],
    );
  }
}
