import 'package:flutter/material.dart';
import 'action_button_view_model.dart'; // Import da ViewModel

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  ActionButton({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Ação ao pressionar o botão
      },
      style: ElevatedButton.styleFrom(
        primary: viewModel.color, // Cor do botão vinda da ViewModel
      ),
      child: Text(viewModel.title), // Título vindo da ViewModel
    );
  }
}
