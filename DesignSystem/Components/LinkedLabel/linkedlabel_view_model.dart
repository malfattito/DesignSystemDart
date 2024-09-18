
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

// Widget para exibir um texto com um link clicável
class LinkedLabel extends StatelessWidget {
  // Texto completo a ser exibido
  final String fullText;
  // Texto parcial que será formatado como um link
  final String linkText;
  // Função a ser chamada quando o link é clicado
  final VoidCallback onLinkTap;

  const LinkedLabel({
    Key? key,
    required this.fullText,
    required this.linkText,
    required this.onLinkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Encontrar a posição inicial e final do linkText no fullText
    final startIndex = fullText.indexOf(linkText);
    final endIndex = startIndex + linkText.length;

    // Dividir o texto completo em partes antes e depois do texto do link
    final beforeLink = fullText.substring(0, startIndex);
    final linkPart = fullText.substring(startIndex, endIndex);
    final afterLink = fullText.substring(endIndex);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: beforeLink, style: TextStyle(color: Colors.black)),
          TextSpan(
            text: linkPart,
            style: TextStyle(
                color: Colors.blue, decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Chama a função de navegação ao clicar no link
                onLinkTap();
              },
          ),
          TextSpan(text: afterLink, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
