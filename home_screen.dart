// lib/designsystem/screens/home_screen.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/designsystem/screen/terms_and_conditions_screen.dart';
import 'pix_payment_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double saldo = 5000.00; // Exemplo de saldo inicial

  void atualizarSaldo(double valor) {
    setState(() {
      saldo -= valor;  // Subtrai o valor pago do saldo atual

      // Exibe uma mensagem de confirmação do pagamento
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pagamento Confirmado!"),
          content: Text('Pagamento de R\$ ${valor.toStringAsFixed(2)} realizado com sucesso!'),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 33, 243, 54),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.pix),
              title: Text('Pix'),
              onTap: () async {
                double valorPago = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PixPaymentScreen()),
                );

                if (valorPago != null && valorPago > 0) {
                  atualizarSaldo(valorPago);  // Atualiza o saldo e exibe a mensagem de sucesso
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo Disponível',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: saldo < 0 ? Colors.red.shade100 : Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'R\$ ${saldo.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Spacer(), // Empurra o restante para o topo

            // Adicionando o RichText com o hyperlink na parte inferior
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Li e concordo com os ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'termos de serviço',
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de termos e condições
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}