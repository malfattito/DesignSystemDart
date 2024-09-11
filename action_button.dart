import 'package:flutter/material.dart';
import 'action_button_view_model.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  ActionButton({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => viewModel.handlePayment(context),
      child: Text('Realizar Pagamento'),
    );
  }
}
