import 'package:flutter/material.dart';
import 'input_text_view_model.dart';

class InputTextField extends StatelessWidget {
  final InputTextViewModel viewModel;

  InputTextField({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: viewModel.controller,
      decoration: InputDecoration(
        labelText: viewModel.labelText,
        hintText: viewModel.hintText,
        border: OutlineInputBorder(),
      ),
      onChanged: viewModel.onChanged,
    );
  }
}
