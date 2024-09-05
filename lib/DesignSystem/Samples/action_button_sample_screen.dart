import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import '../Components/Buttons/ActionButton/action_button_actions.dart';

class ActionButtonSampleScreen extends StatelessWidget {
  const ActionButtonSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActionButtonViewModel viewModelPrimaryLarge = ActionButtonViewModel(
      style: ActionButtonStyle.primary,
      size: ActionButtonSize.large,
      text: 'Action button',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Button Samples'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Botão primário com ação de habilitar/desabilitar
              ActionButton.instantiate(viewModel: viewModelPrimaryLarge),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  ActionButtonActions.enableButton(viewModelPrimaryLarge);
                },
                child: const Text('Enable Primary Large'),
              ),
              ElevatedButton(
                onPressed: () {
                  ActionButtonActions.disableButton(viewModelPrimaryLarge);
                },
                child: const Text('Disable Primary Large'),
              ),
              const SizedBox(height: 16),

              // Adicione mais botões e ações conforme necessário
            ],
          ),
        ),
      ),
    );
  }
}