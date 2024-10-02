import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkedLabel extends StatelessWidget {
  final String fullText;
  final String linkText;
  final VoidCallback onTap;

  const LinkedLabel({
    Key? key,
    required this.fullText,
    required this.linkText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startIndex = fullText.indexOf(linkText);
    final endIndex = startIndex + linkText.length;

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(text: fullText.substring(0, startIndex)), // Representa a parte do texto antes do link, com o estilo padrão.
          TextSpan(
            text: linkText,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline, // Representa o link
            ),
            recognizer: TapGestureRecognizer() // Detecta toques no texto e executa a função onTap quando o link é clicado.
              ..onTap = onTap,
          ),
          TextSpan(text: fullText.substring(endIndex)), // Representa a parte do texto após o link, com o estilo padrão.
        ],
      ),
    );
  }
}