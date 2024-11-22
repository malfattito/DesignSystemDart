import 'package:flutter/material.dart';

enum ActionButtonStyle{
  primary,
  secondary,
  tertiary
}

enum ActionButtonSize{
  small,
  medium,
  large
}

class ActionButtonViewModel {
  final ActionButtonStyle style;
  final ActionButtonSize size;
  final String text;
  final Function() onPressed;
  final IconData? icon;

  ActionButtonViewModel({
    required this.style,
    required this.size,
    required this.text,
    required this.onPressed,
    this.icon
  });
}