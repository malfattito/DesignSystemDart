import 'package:flutter/material.dart';
import 'input_text_view_model.dart';

class InputText extends StatelessWidget {
  final InputTextViewModel viewModel;

  const InputText._(this.viewModel);

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return InputText._(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      filled: true,
      suffixIcon: viewModel.suffixIcon,
      fillColor: viewModel.isEnabled ? Colors.white : Colors.grey.shade400,
      labelText: viewModel.placeholder.isNotEmpty ? viewModel.placeholder : null,
      labelStyle: const TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black),
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.grey)
      ),
    );

    return TextField(
      controller: viewModel.controller,
      obscureText: viewModel.password,
      decoration: decoration.copyWith(errorText: viewModel.hasError ? viewModel.errorMsg : null),
      enabled: viewModel.isEnabled,
    );
  }
}
