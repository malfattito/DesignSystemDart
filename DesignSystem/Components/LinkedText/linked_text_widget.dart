import 'package:flutter/material.dart';
import '../Components/LinkedText/linked_text.dart';

class LinkedTextWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  LinkedTextWidget({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: LinkedTextDesignSystem.linkedTextStyle, // Aplicação do estilo
      ),
    );
  }
}
