import 'package:flutter/material.dart';

class InputTextViewModel extends ChangeNotifier {
  String normalText = '';
  String errorText = '';
  bool hasError = false;

  void setNormalText(String text) {
    normalText = text;
    notifyListeners();
  }

  void setErrorText(String text) {
    errorText = text;
    if (text.isEmpty) {
      hasError = true;
    } else {
      hasError = false;
    }
    notifyListeners();
  }
}
