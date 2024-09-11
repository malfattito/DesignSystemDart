import 'package:flutter/material.dart';
import 'input_text_disabled_view_model.dart';

class InputTextFieldDisabled extends StatelessWidget {
  final InputTextDisabledViewModel viewModel;

  InputTextFieldDisabled({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: viewModel.controller,
      decoration: InputDecoration(
        labelText: viewModel.labelText,
        hintText: viewModel.hintText,
        border: OutlineInputBorder(),
      ),
      enabled: false,  // Campo desabilitado
    );
  }
}
