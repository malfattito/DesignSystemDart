import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'linked_label_viewModel.dart';

class LinkedLabel extends StatelessWidget {
  final LinkedLabelViewModel viewModel;

  const LinkedLabel._(this.viewModel);

  static Widget instantiate({required LinkedLabelViewModel viewModel}) {
    return LinkedLabel._(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    // Definindo os estilos de texto
    double textSize;
    Color textColor;
    Color linkedTextColor;
    TextDecoration decoration;

    // Definindo o tamanho do texto
    switch (viewModel.textSize) {
      case TextSize.large:
        textSize = 20.0;
        break;
      case TextSize.medium:
        textSize = 16.0;
        break;
      case TextSize.small:
        textSize = 14.0;
        break;
    }

    // Definindo a cor do texto normal
    switch (viewModel.textColor) {
      case TextColor.primary:
        textColor = Colors.black;
        break;
      case TextColor.secondary:
        textColor = Colors.grey;
        break;
      case TextColor.tertiary:
        textColor = Colors.red;
        break;
    }

    // Definindo a cor do texto com link
    switch (viewModel.linkedTextColor) {
      case LinkedTextColor.primary:
        linkedTextColor = Colors.blue;
        break;
      case LinkedTextColor.secondary:
        linkedTextColor = Colors.green;
        break;
      case LinkedTextColor.tertiary:
        linkedTextColor = Colors.orange;
        break;
    }

    // Definindo a decoração do texto
    switch (viewModel.textDecoration) {
      case TextDecoration.none:
        decoration = TextDecoration.none;
        break;
      case TextDecoration.underline:
        decoration = TextDecoration.underline;
        break;
      case TextDecoration.lineThrough:
        decoration = TextDecoration.lineThrough;
        break;
    }

    // Exibindo o texto com e sem link
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: viewModel.text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
          TextSpan(
            text: viewModel.linkedText,
            style: TextStyle(
              fontSize: textSize,
              color: linkedTextColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('clicou');
              },
          ),
        ],
      ),
    );
  }
}
