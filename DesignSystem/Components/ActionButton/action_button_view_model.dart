import 'package:flutter/material.dart';

// Enum para os tamanhos do botão
enum ActionButtonSize {
  large,
  medium,
  small,
}

// Enum para os estilos do botão
enum ActionButtonStyle {
  primary,
  secondary,
  tertiary,
}

// Classe ModelView com correção no nome do construtor
class ActionButtonViewModel {
  final ActionButtonStyle style;
  final ActionButtonSize size;
  final String text;
  final Image? image;

  ActionButtonViewModel({
    required this.style,
    required this.size,
    required this.text,
    this.image,
  });
}
/////////