import 'package:flutter/material.dart';

class InputTextErrorViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  String labelText;
  String hintText;
  String errorMessage;
  bool hasError = false;

  InputTextErrorViewModel({
    this.labelText = "Input with Error",
    this.hintText = "Type something...",
    this.errorMessage = "Invalid input!",
  });

  void onChanged(String value) {
    if (value.isEmpty) {
      hasError = true;
    } else {
      hasError = false;
    }
    notifyListeners();  // Notifica a View sobre a mudança
  }

  String getText() {
    return controller.text;
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
