import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class MyForm extends StatelessWidget {
  final TextEditingController _normalController = TextEditingController();
  final TextEditingController _disabledController = TextEditingController();
  final TextEditingController _errorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Text Fields'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Normal Field',
              hintText: 'Enter text',
              controller: _normalController,
              isEnabled: true,
            ),
            CustomTextField(
              labelText: 'Disabled Field',
              hintText: 'Cannot enter text',
              controller: _disabledController,
              isEnabled: false,
            ),
            CustomTextField(
              labelText: 'Field with Error',
              hintText: 'Enter text',
              controller: _errorController,
              isEnabled: true,
              errorText: 'This field has an error',
            ),
          ],
        ),
      ),
    );
  }
}
