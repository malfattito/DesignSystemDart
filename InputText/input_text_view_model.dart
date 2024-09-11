import 'package:flutter/material.dart';

class InputTextViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  String labelText;
  String hintText;

  InputTextViewModel({
    this.labelText = "Enter text",
    this.hintText = "Type something here...",
  });

  void onChanged(String value) {
    // Lógica ao mudar o valor do input
    print("Input value changed: $value");
  }

  String getText() {
    return controller.text;
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
