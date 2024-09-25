import 'package:flutter/material.dart';
import 'package:input_text/Components/InputField/input_text_view_model.dart';

class StyledInputField extends StatefulWidget {
  final InputTextViewModel viewModel;

  const StyledInputField._(this.viewModel, {Key? key}) : super(key: key);

  @override
  StyledInputFieldState createState() => StyledInputFieldState();

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return StyledInputField._(viewModel);
  }
}

class StyledInputFieldState extends State<StyledInputField> {
  late bool _obscureText;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.viewModel.password;
    widget.viewModel.controller.addListener(_validateInput);
  }

  void _validateInput() {
    final errorText = widget.viewModel.validator?.call(widget.viewModel.controller.text);
    setState(() {
      _errorMsg = errorText;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    widget.viewModel.controller.removeListener(_validateInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.viewModel.controller,
      obscureText: _obscureText,
      decoration: _inputDecoration(),
      style: const TextStyle(color: Colors.black),
      enabled: widget.viewModel.isEnabled,
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      filled: true,
      suffixIcon: _buildSuffixIcon(),
      fillColor: widget.viewModel.isEnabled ? Colors.white : Colors.grey.shade400,
      labelText: widget.viewModel.placeholder.isNotEmpty ? widget.viewModel.placeholder : null,
      labelStyle: const TextStyle(color: Colors.black),
      border: _borderStyle(),
      errorBorder: _errorBorderStyle(),
      focusedBorder: _borderStyle(),
      enabledBorder: _borderStyle(),
      disabledBorder: _disabledBorderStyle(),
      errorText: _errorMsg,
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.viewModel.password) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: _togglePasswordVisibility,
      );
    }
    return widget.viewModel.suffixIcon;
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.black),
    );
  }

  OutlineInputBorder _errorBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.red),
    );
  }

  OutlineInputBorder _disabledBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }
}
