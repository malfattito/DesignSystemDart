import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final bool showSuffix;
  final bool enabled;
  final bool hasError;
  final String? errorMessage;

  const CustomTextField({
    Key? key,
    required this.label,
    this.initialValue,
    this.showSuffix = false,
    this.enabled = true,
    this.hasError = false,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: hasError ? Colors.red : (enabled ? Colors.black : Colors.grey),
        ),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: hasError ? Colors.red : Colors.grey,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: hasError ? Colors.red : Colors.blue,
            width: 2,
          ),
        ),
        suffixIcon: showSuffix
            ? Container(
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: hasError ? Colors.red : (enabled ? Colors.black : Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '24',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : null,
        errorText: hasError ? errorMessage : null,
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
      ),
    );
  }
}
