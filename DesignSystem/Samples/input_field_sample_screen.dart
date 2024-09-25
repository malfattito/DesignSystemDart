import 'package:flutter/material.dart';
import 'package:input_text/Components/InputField/input_text.dart';
import 'package:input_text/Components/InputField/input_text_view_model.dart';

class InputFieldPage extends StatelessWidget {
  final List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());

  InputFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo de Campos de Entrada Estilizados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(controllers[0], false, 'Label', _nameValidator),
            const SizedBox(height: 20),
            _buildInputField(controllers[1], true, 'Label', _passwordValidator, suffixIcon: const Icon(Icons.remove_red_eye)),
            const SizedBox(height: 20),
            const Text("Desativado"),
            const SizedBox(height: 20),
            _buildDisabledInputField(controllers[2], 'Label'),
            const SizedBox(height: 20),
            _buildDisabledInputField(controllers[3], 'Label', suffixIcon: const Icon(Icons.remove_red_eye)),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, bool isPassword, String placeholder, String? Function(String?)? validator, {Widget? suffixIcon}) {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: controller,
        placeholder: placeholder,
        password: isPassword,
        suffixIcon: suffixIcon,
        validator: validator,
      ),
    );
  }

  Widget _buildDisabledInputField(TextEditingController controller, String placeholder, {Widget? suffixIcon}) {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: controller,
        placeholder: placeholder,
        password: false,
        isEnabled: false,
        suffixIcon: suffixIcon,
      ),
    );
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Somente letras são permitidas!';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo é obrigatório';
    }
    return null;
  }
}
