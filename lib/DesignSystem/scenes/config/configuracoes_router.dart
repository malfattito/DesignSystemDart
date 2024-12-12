import 'package:flutter/material.dart';
import 'configuracoes_page.dart';

class ConfiguracoesRouter {
  static void navigateToConfiguracoes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Configuracoes(),
      ),
    );
  }
}
