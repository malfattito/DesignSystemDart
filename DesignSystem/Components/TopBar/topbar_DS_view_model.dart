import 'package:flutter/material.dart';

// Enum para os tamanhos do botão
enum ActionTopBarOptionSize {
  large,
  medium,
  small,
}

// Enum para os estilos do botão
enum ActionTopBarSelection {
  unselected,
  selected
}

class ActionTopBarViewModel {
  final ActionTopBarOptionSize size;
  final List<String> options;
  int selectedIndex;

  ActionTopBarViewModel({
    required this.size,
    required this.options,
    this.selectedIndex=0, // Índice inicial é 0
  });
}
