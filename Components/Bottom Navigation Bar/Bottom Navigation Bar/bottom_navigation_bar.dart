import 'package:flutter/material.dart';
import 'bottom_navigation_bar_view_model.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ActionBottomBarViewModel viewModel;

  const CustomBottomNavigationBar._(this.viewModel);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();

  // Método para instanciar o widget com o ViewModel apropriado
  static Widget instantiate({required ActionBottomBarViewModel viewModel}) {
    return CustomBottomNavigationBar._(viewModel);
  }
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.viewModel.items.length, (index) {
          final item = widget.viewModel.items[index];
          final isSelected = index == widget.viewModel.selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                widget.viewModel.selectedIndex = index;
                widget.viewModel.onItemSelected(index);
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  color: isSelected ? Colors.yellow : Colors.black,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: _getFontSize(widget.viewModel.size),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.yellow : Colors.black,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  double _getFontSize(ActionBottomBarOptionSize size) {
    switch (size) {
      case ActionBottomBarOptionSize.large:
        return 20;
      case ActionBottomBarOptionSize.medium:
        return 16;
      case ActionBottomBarOptionSize.small:
        return 12;
      default:
        return 16;
    }
  }
}

class BottomNavigationBarController {
  final ActionBottomBarViewModel viewModel;

  BottomNavigationBarController(this.viewModel);
}
