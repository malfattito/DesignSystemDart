import 'package:flutter/material.dart';



// Classe ModelView com correção no nome do construtor
class InputTextViewModel {
  final TextEditingController controller;
  final String placeholder;
  final bool password;
  final Widget? suffixIcon;
  final String? errorMsg;
  final bool isEnabled;
  final bool hasError;



  InputTextViewModel ({
    required this.controller,
    required this.placeholder,
    required this.password,
    this.errorMsg,
    this.suffixIcon,
    this.isEnabled = true,
    this.hasError = false,
  });
}