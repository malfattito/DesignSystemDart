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
class ActionButtonViewModel extends ChangeNotifier{
  final ActionButtonStyle style;
  final ActionButtonSize size;
  final String text;
  final Image? image;

  bool _isEnabled = true;
  bool _hasError = false;

  bool get isEnabled => _isEnabled;
  bool get hasError => _hasError;

  void enable() {
    _isEnabled = true;
    _hasError = false;
    notifyListeners();
  }

  void disable() {
    _isEnabled = false;
    notifyListeners();
  }

  void showError() {
    _hasError = true;
    notifyListeners();
  }

  void clearError() {
    _hasError = false;
    notifyListeners();
  }

  ActionButtonViewModel({
    required this.style,
    required this.size,
    required this.text,
    this.image,
  });
}
