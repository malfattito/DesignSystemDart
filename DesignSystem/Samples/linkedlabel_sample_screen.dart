import 'package:flutter/material.dart';
import '../Components/LinkedLabel/linkedlabel_view_model.dart';

// Nova página que será exibida ao clicar no link
class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('new page!'),
      ),
    );
  }
}

// Tela de amostra que usa o LinkedLabel
class LinkedLabelSampleScreen extends StatelessWidget {
  const LinkedLabelSampleScreen({Key? key}) : super(key: key);

  // Função para navegar para a nova página
  void _navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linked Label Sample Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LinkedLabel(
          fullText: 'I have read and agree Terms & Services',
          linkText: 'Terms & Services',
          // Passa a função de navegação para o LinkedLabel
          onLinkTap: () => _navigateToNewPage(context),
        ),
      ),
    );
  }
}