import 'package:flutter/material.dart';
import 'action_button.dart';
import 'action_button_view_model.dart'; // Import da ViewModel e do Botão

void main() {
  runApp(MyApp());
}

class import 'package:flutter/material.dart';
import 'action_button.dart';
import 'action_button_view_model.dart'; // Import da ViewModel e do Botão

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botão com ViewModel'),
        ),
        body: Center(
          child: ActionButton(
            viewModel: ActionButtonViewModel(
              title: 'Clique Aqui',
              color: Colors.blue, // Exemplo de cor
            ),
          ),
        ),
      ),
    );
  }
} extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botão com ViewModel'),
        ),
        body: Center(
          child: ActionButton(
            viewModel: ActionButtonViewModel(
              title: 'Clique Aqui',
              color: Colors.blue, // Exemplo de cor
            ),
          ),
        ),
      ),
    );
  }
}
