import 'package:flutter/material.dart';
import 'tabbar_view_model.dart';

class CustomTabBar extends StatefulWidget {
  final TabBarViewModel viewModel;
  final Function(int) onTabSelected;

  const CustomTabBar._(this.viewModel, this.onTabSelected);

  static Widget instantiate(TabBarViewModel viewModel, Function(int) onTabSelected) {
    return CustomTabBar._(viewModel, onTabSelected);
  }

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(widget.viewModel.tabTitles.length, (index) {
        final bool isSelected = _selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onTabSelected(index);
          },
          child: Container(
            width: MediaQuery.of(context).size.width / widget.viewModel.tabTitles.length, // Divide a largura disponível entre as abas
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.viewModel.tabTitles[index],
                  textAlign: TextAlign.center, // Centraliza o texto horizontalmente
                  style: TextStyle(
                    color: isSelected ? Color(0xFFF8D247) : Colors.white,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                Container(
                  height: 4, // Mantém a altura da linha sempre, independente de estar selecionada ou não
                  width: double.infinity, // Ocupa toda a largura do espaço da aba
                  color: isSelected ? Color(0xFFF8D247) : Colors.transparent, // Cor ou transparente
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}