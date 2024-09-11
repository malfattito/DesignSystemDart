import 'package:flutter/material.dart';

class InputTextDisabledViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  String labelText;
  String hintText;

  InputTextDisabledViewModel({
    this.labelText = "Disabled Field",
    this.hintText = "This field is disabled",
  });

  String getText() {
    return controller.text;
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
