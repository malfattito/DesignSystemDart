import 'package:flutter/material.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';

class ActionButtonSampleScreen extends StatelessWidget {
  const ActionButtonSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  style: ActionButtonStyle.primary,
                  size: ActionButtonSize.large,
                  text: 'Ok',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}