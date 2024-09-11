import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Termos e Condições'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Termos de Serviço',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Detalhes de Termos e Serviço ainda não implementado.'
              'Código em construção'
              'Será adicionado após confirmação de funcionamento.',
              style: TextStyle(fontSize: 16),
            )
          ],
        )
      )
      );
  }
  
}