import 'package:flutter/material.dart';
import 'package:input_text/Components/Buttons/ActionButton/action_button.dart';
import 'package:input_text/Components/Buttons/ActionButton/action_button_view_model.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo de Botões Ação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          children: [
            _buildButtonColumn(ActionButtonStyle.primary),
            _buildButtonColumn(ActionButtonStyle.secondary),
            _buildButtonColumn(ActionButtonStyle.tertiary),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonColumn(ActionButtonStyle style) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _createActionButton(ActionButtonSize.large, style, 'Grande'),
        const SizedBox(height: 10),
        _createActionButton(ActionButtonSize.medium, style, 'Médio'),
        const SizedBox(height: 10),
        _createActionButton(ActionButtonSize.small, style, 'Pequeno'),
      ],
    );
  }

  Widget _createActionButton(ActionButtonSize size, ActionButtonStyle style, String text, {IconData? icon}) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        size: size,
        style: style,
        text: text,
        icon: icon ?? (style != ActionButtonStyle.tertiary ? null : Icons.navigate_next_outlined),
        onPressed: () {},
      ),
    );
  }
}
