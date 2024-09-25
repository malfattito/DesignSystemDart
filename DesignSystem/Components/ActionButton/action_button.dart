import 'package:flutter/material.dart';
import 'action_button_view_model.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._(this.viewModel);

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 32.0;
    Color buttonColor = Color(0xFFF8D247);

    switch (viewModel.size) {
      case ActionButtonSize.large:
        buttonSize = 32.0;
        break;
      case ActionButtonSize.medium:
        buttonSize = 24.0;
        break;
      case ActionButtonSize.small:
        buttonSize = 16.0;
        break;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        buttonColor = Color(0xFFF8D247);
        break;
      case ActionButtonStyle.secondary:
        buttonColor = Color(0xFF274FF5);
        break;
      case ActionButtonStyle.tertiary:
        buttonColor = Color(0xFFF87147);
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (viewModel.image != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: buttonSize / 2,
                height: buttonSize / 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: viewModel.image,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(
                2.0), // Adiciona 2 unidades de espaço ao redor do texto
            child: Text(
              viewModel.text,
              style: TextStyle(fontSize: buttonSize),
            ),
          ),
        ],
      ),
    );
  }
}

/////////