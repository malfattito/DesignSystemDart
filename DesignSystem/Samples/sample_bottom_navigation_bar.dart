import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Bottom Navigation Bar/Bottom Navigation Bar/bottom_navigation_bar.dart';
import 'package:untitled/DesignSystem/Components/Bottom Navigation Bar/Bottom Navigation Bar/bottom_navigation_bar_view_model.dart';
import 'package:untitled/DesignSystem/Components/TopBar/topbar_DS.dart';

import '../../Components/TopBar/topbar_DS_view_model.dart';
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationBarScreen> {
  late ActionBottomBarViewModel viewModel;

  @override
  void initState() {
    super.initState();
    // Inicializa o ViewModel com os dados necessários
    viewModel = ActionBottomBarViewModel(
      size: ActionBottomBarOptionSize.medium, // Exemplo de tamanho
      style: ActionBottomNavigationBarStyle.primary, // Exemplo de estilo
      items: [
        BottomBarItem(icon: Icons.home, label: 'Casa'),
        BottomBarItem(icon: Icons.history, label: 'Histórico'),
        BottomBarItem(icon: Icons.save, label: 'Salvos'),
        BottomBarItem(icon: Icons.person, label: 'Perfil'),
      ],
      onItemSelected: (int index) {
        // Função de callback ao selecionar um item
        setState(() {
          viewModel.selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        children: [
          TopBarDS(viewModel: ActionTopBarViewModel(size: ActionTopBarOptionSize.small, options: ['Tab 1', 'Tab 2', 'Tab 3'])),
          Expanded(
            child: Center(
              child: Text(
                'Botão selecionado: ${viewModel.items[viewModel.selectedIndex].label}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar.instantiate(viewModel: viewModel),
    );
  }
}
