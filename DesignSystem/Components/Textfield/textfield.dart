import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Textfield/textfiled_view_model.dart';

class TextfieldInput extends StatefulWidget {
  final ActionTextfieldViewModel viewModel;

  const TextfieldInput({Key? key, required this.viewModel}) : super(key: key);

  // Método instantiate corrigido
  static Widget instantiate({required ActionTextfieldViewModel viewModel}) {
    return TextfieldInput(viewModel: viewModel);
  }

  @override
  _TextfieldInputState createState() => _TextfieldInputState();
}

class _TextfieldInputState extends State<TextfieldInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: widget.viewModel.image != null
            ? ImageIcon(widget.viewModel.image!.image)
            : null,
        labelText: widget.viewModel.text, // Corrigido de outText para text
        enabledBorder: _getBorderStyle(widget.viewModel.style),  // Borda quando o campo não está focado
        focusedBorder: _getBorderStyle(widget.viewModel.style),  // Borda quando o campo está focado
      ),
      style: _getTextStyle(widget.viewModel.style), // Corrigido para passar style
    );
  }

  InputBorder _getBorderStyle(ActionTextfieldStyle style) {
    switch (style) {
      case ActionTextfieldStyle.sucessful: // Corrigido de sucessful para successful
        return const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        );
      case ActionTextfieldStyle.failure:
        return const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        );
      case ActionTextfieldStyle.write:
        return const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        );
      default:
        return const OutlineInputBorder(); // Borda padrão
    }
  }

  TextStyle _getTextStyle(ActionTextfieldStyle style) { // Corrigido o parâmetro para ActionTextfieldStyle
    switch (style) {
      case ActionTextfieldStyle.sucessful: // Corrigido de sucessful para successful
        return const TextStyle(fontSize: 20, color: Colors.green);
      case ActionTextfieldStyle.failure:
        return const TextStyle(fontSize: 20, color: Colors.red);
      case ActionTextfieldStyle.write:
        return const TextStyle(fontSize: 20, color: Colors.grey);
      default:
        return const TextStyle(fontSize: 20); // Tamanho de texto padrão
    }
  }
}
