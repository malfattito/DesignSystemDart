import 'package:flutter/material.dart';
import 'tab_bar_view_model.dart';

class TabBarWidget extends StatefulWidget {
  final TabBarViewModel viewModel;
  final Function(int) onTabSelected;


  const TabBarWidget({Key? key, required this.viewModel, required this.onTabSelected}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.viewModel.tabs.length,
            (index) => Expanded(
          child: GestureDetector(
            onTap: () {
                widget.onTabSelected(index);
              },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: index == widget.viewModel.selectedIndex
                        ? Colors.amber
                        : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(widget.viewModel.tabs[index]),
            ),
          ),
        ),
      ),
    );
  }
}