import 'package:flutter/material.dart';

class InputTextSampleScreen extends StatefulWidget {
  const InputTextSampleScreen({Key? key}) : super(key: key);

  @override
  _InputTextSampleScreenState createState() => _InputTextSampleScreenState();
}

class _InputTextSampleScreenState extends State<InputTextSampleScreen> {
  final TextEditingController _controller = TextEditingController();
  String _errorMessage = '';
  bool _isInputValid = false;

  void _validateInput(String input) {
    setState(() {
      if (input.isEmpty) {
        _errorMessage = 'Campo não pode estar vazio';
        _isInputValid = false;
      } else if (input.length < 6) {
        _errorMessage = 'O texto precisa ter pelo menos 6 caracteres';
        _isInputValid = false;
      } else {
        _errorMessage = '';
        _isInputValid = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validação de Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              onChanged: _validateInput,
              decoration: InputDecoration(
                labelText: 'Digite algo',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isInputValid ? () {} : null,
              child: const Text('Verificar'),
            ),
            if (_isInputValid)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Tudo ok!',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

