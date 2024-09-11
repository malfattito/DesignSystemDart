import 'package:flutter/material.dart';
import '../../Components/Input/textfield.dart';
import '../../Components/Input/textfiled_view_model.dart';

class ActionTextfieldSampleScreen extends StatelessWidget {
  const ActionTextfieldSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textfield Samples'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextfieldInput.instantiate(
                viewModel: ActionTextfieldViewModel(
                  style: ActionTextfieldStyle.write,
                  size: ActionTextfieldSize.medium,
                  text: 'Digite aqui...',
                ),
              ),
              SizedBox.fromSize(size: const Size.fromHeight(16.0)),

              TextfieldInput.instantiate(
                viewModel: ActionTextfieldViewModel(
                  style: ActionTextfieldStyle.sucessful,
                  size: ActionTextfieldSize.medium,
                  text: 'Escrevi certo',
                ),
              ),
              SizedBox.fromSize(size: const Size.fromHeight(16.0)),
              TextfieldInput.instantiate(
                viewModel: ActionTextfieldViewModel(
                  style: ActionTextfieldStyle.failure,
                  size: ActionTextfieldSize.medium,
                  text: 'Escrevi algo errado',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
