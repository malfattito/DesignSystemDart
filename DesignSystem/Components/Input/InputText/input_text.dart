import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;

  const InputText({
    Key? key,  // Adicionando a chave para seguir boas práticas
    required this.controller,
    required this.hint,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),  // 'const' aqui otimiza a renderização
      ),
      validator: validator,
    );
  }
}

// Função de validação de email
String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email não pode ser vazio';
  }
  // Expressão regular simples para validação de email
  const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
  final regExp = RegExp(emailPattern);

  if (!regExp.hasMatch(value)) {
    return 'Por favor, insira um email válido';
  }
  return null;
}

