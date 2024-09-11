import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_view_model.dart';

class BottomNavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BottomNavigationViewModel>();

    return BottomNavigationBar(
      currentIndex: viewModel.selectedIndex,
      onTap: viewModel.onItemTapped,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        _buildBarItem(Icons.circle, "Label", viewModel.selectedIndex == 0),
        _buildBarItem(Icons.circle, "Messages", viewModel.selectedIndex == 1, isMessage: true),
        _buildBarItem(Icons.circle, "Label", viewModel.selectedIndex == 2),
        _buildBarItem(Icons.circle, "Profile", viewModel.selectedIndex == 3),
      ],
    );
  }

  BottomNavigationBarItem _buildBarItem(IconData icon, String label, bool isSelected, {bool isMessage = false}) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.black,
              ),
              Text(
                '24', // O número que você deseja mostrar
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      label: label,
    );
  }
}
