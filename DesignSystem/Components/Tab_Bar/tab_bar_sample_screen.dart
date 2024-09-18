import 'package:flutter/material.dart';
import '../Components/Tabs/Tab_Bar/tab_bar.dart';
import '../Components/Tabs/Tab_Bar/tab_bar_view_model.dart';


// ...

class TabBarSampleScreen extends StatefulWidget {
  const TabBarSampleScreen({super.key});

  @override
  _TabBarSampleScreenState createState() => _TabBarSampleScreenState();
}

class _TabBarSampleScreenState extends State<TabBarSampleScreen> {
  final TabBarViewModel viewModel = TabBarViewModel(
    tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
  );

  void _onTabSelected(int index) {
    setState(() {
      viewModel.selectTab(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBarWidget(viewModel: viewModel, onTabSelected: _onTabSelected),
          Expanded(
            child: IndexedStack(
              index: viewModel.selectedIndex,
              children:  const [
                Center(child: Text('Conteúdo da Tab 1')),
                Center(child: Text('Conteúdo da Tab 2')),
                Center(child: Text('Conteúdo da Tab 3')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}