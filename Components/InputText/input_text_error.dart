import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'input_text_error_view_model.dart';

class InputTextFieldError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<InputTextErrorViewModel>();

    return TextField(
      controller: viewModel.controller,
      decoration: InputDecoration(
        labelText: viewModel.labelText,
        hintText: viewModel.hintText,
        border: OutlineInputBorder(),
        errorText: viewModel.hasError ? viewModel.errorMessage : null,
      ),
      onChanged: viewModel.onChanged,
    );
  }
}
