import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActionButtonViewModel {
  final TextEditingController controller;
  final double maxValue;
  final NumberFormat currencyFormat = NumberFormat.simpleCurrency(locale: 'pt_BR', name: '');

  ActionButtonViewModel({required this.controller, required this.maxValue});

  void handlePayment(BuildContext context) {
    String value = controller.text.replaceAll(RegExp(r'[^\d]'), '');
    double parsedValue = double.tryParse(value) ?? 0.0;
    parsedValue /= 100; // Convert cents to reais

    if (parsedValue >= maxValue) {
      // Exibe mensagem de erro se o valor for maior que o limite
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('O valor inserido está acima do limite possível de ${currencyFormat.format(maxValue)}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Lógica para realizar o pagamento
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pagamento realizado com sucesso!')),
      );
    }
  }
}
