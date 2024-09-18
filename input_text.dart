import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'input_text_view_model.dart';

class InputText extends StatelessWidget {
  final InputTextViewModel viewModel;

  const InputText._(this.viewModel);

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return InputText._(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputTextField(viewModel),
        SizedBox(height: 20),
        _buildDisabledTextField(viewModel),
        SizedBox(height: 20),
        _buildErrorTextField(viewModel),
      ],
    );
  }

  Widget _buildInputTextField(InputTextViewModel viewModel) {
    return TextField(
      enabled: true,
      decoration: InputDecoration(
        labelText: 'Normal Input',
        border: OutlineInputBorder(),
      ),
      onChanged: (text) => viewModel.setNormalText(text),
    );
  }

  Widget _buildDisabledTextField(InputTextViewModel viewModel) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        labelText: 'Disabled Input',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildErrorTextField(InputTextViewModel viewModel) {
    return TextField(
      enabled: true,
      decoration: InputDecoration(
        labelText: 'Error Input',
        border: OutlineInputBorder(),
        errorText: viewModel.hasError ? 'Error message' : null,
      ),
      onChanged: (text) => viewModel.setErrorText(text),
    );
  }
}
