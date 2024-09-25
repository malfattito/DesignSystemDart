import 'package:flutter/material.dart';
import 'bottom_tab_bar_view_model.dart';

class BottomTabBarWidget extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final Function(int) onTabSelected;

  const BottomTabBarWidget({
    Key? key,
    required this.viewModel,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: viewModel.selectedIndex,
      onTap: onTabSelected,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.label),
          label: 'Label',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label),
          label: 'Label',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}