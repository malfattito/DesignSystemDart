import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Certifique-se de importar provider
import 'bottom_bar_view_model.dart';

class BottomBar extends StatelessWidget {
  final List<Widget> pages;

  BottomBar({required this.pages});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomBarViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: IndexedStack(
            index: model.currentIndex,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: (index) {
              model.setIndex(index);
            },
            selectedItemColor: Colors.blue, // Cor para o item selecionado
            unselectedItemColor: Colors.grey, // Cor para os itens não selecionados
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
