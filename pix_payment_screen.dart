import 'package:flutter/material.dart';
import '../components/PixField/pix_text_field.dart';
import '../components/ActionButton/action_button_view_model.dart';
import '../components/AppBar/custom_app_bar.dart';

class PixPaymentScreen extends StatefulWidget {
  @override
  _PixPaymentScreenState createState() => _PixPaymentScreenState();
}

class _PixPaymentScreenState extends State<PixPaymentScreen> {
  final TextEditingController _controller = TextEditingController();
  final double maxValue = 10000.0; // O limite máximo de valor em reais

  void realizarPagamento() {
    double valor = double.tryParse(_controller.text.replaceAll(',', '.')) ?? 0;
    if (valor > 0 && valor <= maxValue) {
      Navigator.pop(context, valor);  // Retorna o valor pago para a HomeScreen
    } else if (valor > maxValue) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('O valor inserido está acima do limite possível.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ActionButtonViewModel(controller: _controller, maxValue: maxValue);

    return Scaffold(
      appBar: CustomAppBar(title: 'Envio de PIX'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PixTextField(maxValue: maxValue, controller: _controller),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: realizarPagamento,
              child: Text('Realizar Pagamento'),
            ),
          ],
        ),
      ),
    );
  }
}
