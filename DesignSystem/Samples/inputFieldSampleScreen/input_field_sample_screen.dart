import 'package:flutter/material.dart';
import 'package:input_text/Components/InputField/input_text.dart';
import 'package:input_text/Components/InputField/input_text_view_model.dart';

class InputFieldPage extends StatelessWidget {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController passwordController3 = TextEditingController();
  
  InputFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styled Input Field Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: controller1,
                placeholder: 'Label',
                password: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Esse campo é obrigatório';
                  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Somente letras são permitidas!';
                  }
                  return null;
                }
              ),
            ),
            const SizedBox(height: 20,),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController1,
                placeholder: 'Label',
                password: true,
                suffixIcon: const Icon(Icons.remove_red_eye),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Esse campo é obrigatório';
                  }
                  return null;
                }
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Disabled"),
            const SizedBox(height: 20,),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: controller2,
                placeholder: 'Label',
                password: false,
                isEnabled: false,
              ),
            ),
            const SizedBox(height: 20,),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController2,
                placeholder: 'Label',
                password: false,
                isEnabled: false,
                suffixIcon: const Icon(Icons.remove_red_eye)
              ),
            ),
          ],
        ),
      ),
    );
  }
}