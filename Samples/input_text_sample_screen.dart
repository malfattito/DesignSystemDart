import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/InputText/input_text.dart';
import '../Components/InputText/input_text_view_model.dart';
import '../Components/InputText/input_text_disabled.dart';
import '../Components/InputText/input_text_disabled_view_model.dart';
import '../Components/InputText/input_text_error.dart';
import '../Components/InputText/input_text_error_view_model.dart';

class InputTextSampleScreen extends StatelessWidget {
  const InputTextSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Text Samples'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Campo de texto básico
              ChangeNotifierProvider(
                create: (_) => InputTextViewModel(),
                child: InputTextField(
                  viewModel: InputTextViewModel(
                    labelText: 'Basic Input',
                    hintText: 'Type something here...',
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Campo de texto desabilitado
              ChangeNotifierProvider(
                create: (_) => InputTextDisabledViewModel(),
                child: InputTextFieldDisabled(
                  viewModel: InputTextDisabledViewModel(
                    labelText: 'Disabled Input',
                    hintText: 'This field is disabled',
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Campo de texto com erro
              ChangeNotifierProvider(
                create: (_) => InputTextErrorViewModel(),
                child: InputTextFieldError(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
