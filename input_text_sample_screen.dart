import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/InputText/input_text.dart';
import '../Components/InputText/input_text_view_model.dart';

class InputTextSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InputTextViewModel>(
          create: (_) => InputTextViewModel(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sample Input Text States'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Use the buttons to switch between the states: Normal, Disabled, and Error.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              InputText.instantiate(
                viewModel: Provider.of<InputTextViewModel>(context, listen: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
