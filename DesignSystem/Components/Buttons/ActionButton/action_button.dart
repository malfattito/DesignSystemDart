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
    double buttonSize = 40.0;
    Color buttonColor = Colors.blue;

    switch (viewModel.size) {
      case ActionButtonSize.large:
        buttonSize = 48.0;
        break;
      case ActionButtonSize.medium:
        buttonSize = 36.0;
        break;
      case ActionButtonSize.small:
        buttonSize = 28.0;
        break;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        buttonColor = Color(0xFFF8D247); // Amarelo
        break;
      case ActionButtonStyle.secondary:
        buttonColor = Color(0xFF274FF5); // Azul
        break;
      case ActionButtonStyle.tertiary:
        buttonColor = Color(0xFFF87147); // Laranja
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(12.0), // Raio menor para um visual mais moderno
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // Sombra ligeiramente abaixo do botão
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (viewModel.image != null)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: SizedBox(
                width: buttonSize * 0.6, // Imagem ajustada ao tamanho do botão
                height: buttonSize * 0.6,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: viewModel.image,
                ),
              ),
            ),
          Text(
            viewModel.text,
            style: TextStyle(
              fontSize: buttonSize * 0.4, // Ajusta o tamanho da fonte conforme o tamanho do botão
              fontWeight: FontWeight.w600, // Peso da fonte para um texto mais marcante
              color: Colors.white, // Cor do texto para contraste
            ),
          ),
        ],
      ),
    );
  }
}