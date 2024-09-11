// lib/designsystem/components/PixField/pix_text_field.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PixTextField extends StatefulWidget {
  final double maxValue;
  final TextEditingController controller;

  PixTextField({required this.maxValue, required this.controller});

  @override
  _PixTextFieldState createState() => _PixTextFieldState();
}

class _PixTextFieldState extends State<PixTextField> {
  Color _fieldColor = Colors.white;
  final NumberFormat currencyFormat = NumberFormat.simpleCurrency(locale: 'pt_BR', name: '');

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);
  }

  void _validateInput() {
    String value = widget.controller.text.replaceAll(RegExp(r'[^\d]'), '');
    if (value.isNotEmpty) {
      // Converte o valor de centavos para reais
      double parsedValue = double.parse(value) / 100;
      
      setState(() {
        // Ajuste da lógica para comparar corretamente com maxValue
        _fieldColor = parsedValue >= widget.maxValue ? Colors.red.shade100 : Colors.white;
        // Atualiza o texto formatado
        widget.controller.value = widget.controller.value.copyWith(
          text: currencyFormat.format(parsedValue),
          selection: TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Valor do PIX',
        fillColor: _fieldColor,
        filled: true,
        border: OutlineInputBorder(),
      ),
    );
  }
}
