import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.yellow, // Cor do indicador (linha abaixo da aba)
      labelColor: Colors.yellow, // Cor do texto da aba selecionada
      unselectedLabelColor: Colors.grey, // Cor do texto das abas não selecionadas
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.label, size: 30), 
          text: 'Label',
        ),
        Tab(
          icon: Icon(Icons.messenger, size: 30), 
          text: 'Messages',
        ),
        Tab(
          icon: Icon(Icons.label, size: 30), 
          text: 'Label',
        ),
        Tab(
          icon: Icon(Icons.person, size: 30), 
          text: 'Profile',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
