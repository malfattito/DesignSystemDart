import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/TopBar/topbar_DS.dart';
import 'package:untitled/DesignSystem/Components/TopBar/topbar_DS_view_model.dart';

class TopBarScreen extends StatefulWidget {
  const TopBarScreen({super.key});

  @override
  _TopBarScreenState createState() => _TopBarScreenState();
}

class _TopBarScreenState extends State<TopBarScreen> {
  late ActionTopBarViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ActionTopBarViewModel(
      size: ActionTopBarOptionSize.small,
      options: ['Tab 1', 'Tab 2', 'Tab 3'],
      selectedIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopBarDS Example'),
      ),
      body: Column(
        children: [
          TopBarDS.instantiate(viewModel: viewModel),
          const SizedBox(height: 10),
          Expanded(
              child: Text(
                'Botão selecionado: ${viewModel.selectedIndex+1}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
