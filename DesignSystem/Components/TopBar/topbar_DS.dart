import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/TopBar/topbar_DS_view_model.dart';

class TopBarDS extends StatefulWidget {
  final ActionTopBarViewModel viewModel;

  const TopBarDS({Key? key, required this.viewModel}) : super(key: key);

  @override
  TopBarDSState createState() => TopBarDSState();
  static Widget instantiate({required ActionTopBarViewModel viewModel}) {
    return TopBarDS(viewModel: viewModel);
  }
}

class TopBarDSState extends State<TopBarDS> {
  late TopBarDSController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TopBarDSController(widget.viewModel);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.viewModel.options.length, (index) {
          final option = widget.viewModel.options[index];
          final isSelected = index == widget.viewModel.selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                widget.viewModel.selectedIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  option,
                  style: TextStyle(
                    fontSize: _getFontSize(widget.viewModel.size),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.yellow : Colors.white,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 2,
                    width: 50,
                    color: Colors.yellow,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  double _getFontSize(ActionTopBarOptionSize size) {
    switch (size) {
      case ActionTopBarOptionSize.large:
        return 20;
      case ActionTopBarOptionSize.medium:
        return 16;
      case ActionTopBarOptionSize.small:
        return 12;
      default:
        return 16;
    }
  }
}

class TopBarDSController {
  final ActionTopBarViewModel viewModel;

  TopBarDSController(this.viewModel);
}
