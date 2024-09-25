import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        Center(child: Text('Págia de Opções', style: TextStyle(color: Colors.white))),
        Center(child: Text('Página de Config', style: TextStyle(color: Colors.white))),
        Center(child: Text('Página de Help', style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
