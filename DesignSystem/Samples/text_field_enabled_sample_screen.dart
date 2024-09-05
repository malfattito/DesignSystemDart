import 'package:flutter/material.dart';
import '../Components/Input/TextField/text_field.dart';

class TextFieldSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Input Texts'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Enabled TextFields
              Text(
                'Enabled',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              CustomTextField(
                label: 'Label',
                showSuffix: true,
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                initialValue: 'Value',
                showSuffix: true,
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                initialValue: 'Value',
              ),
              SizedBox(height: 40),

              // Disabled TextFields
              Text(
                'Disabled',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              CustomTextField(
                label: 'Label',
                showSuffix: true,
                enabled: false,
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                initialValue: 'Value',
                showSuffix: true,
                enabled: false,
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                enabled: false,
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                initialValue: 'Value',
                enabled: false,
              ),
              SizedBox(height: 40),

              // Error TextFields
              Text(
                'Error',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              CustomTextField(
                label: 'Label',
                showSuffix: true,
                hasError: true,
                errorMessage: 'Error msg, put what you wanna',
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                initialValue: 'Value',
                showSuffix: true,
                hasError: true,
                errorMessage: 'Error msg, put what you wanna',
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                hasError: true,
                errorMessage: 'Error msg, put what you wanna',
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Label',
                initialValue: 'Value',
                hasError: true,
                errorMessage: 'Error msg, put what you wanna',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
