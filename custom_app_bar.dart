import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 39, 176, 55), // Cor do contêiner
          borderRadius: BorderRadius.circular(8.0), // Borda arredondada
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white, // Cor do texto
          ),
        ),
      ),
      centerTitle: true, // Centraliza o título na AppBar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}