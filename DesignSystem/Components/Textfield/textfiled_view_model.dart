import 'package:flutter/material.dart';

// Enum para os tamanhos do botão
enum ActionTextfieldSize {
  large,
  medium,
  small,
}

// Enum para os estilos do botão
enum ActionTextfieldStyle {
  sucessful,
  failure,
  write,
}

// Classe ModelView com correção no nome do construtor
class ActionTextfieldViewModel {
  final ActionTextfieldStyle style;
  final ActionTextfieldSize size;
  final String? text;
  final String? outText;
  final Image? image;

  ActionTextfieldViewModel({
    this.outText,
    required this.style,
    required this.size,
    this.text,
    this.image,
  });
}