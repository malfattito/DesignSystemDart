import 'package:flutter/material.dart';

enum ActionButtonSize{
  small,
  medium,
  large
}

enum ActionButtonStyle{
  primary,
  secondary,
  tertiary
}

class ActionButtonViewModel {
  final ActionButtonSize size;
  final ActionButtonStyle style;
  final String text;
  final IconData? icon;
  final Function() onPressed;

  ActionButtonViewModel({
    required this.size,
    required this.style,
    required this.text,
    required this.onPressed,
    this.icon
  });
}