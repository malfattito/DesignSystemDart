import 'package:flutter/material.dart';
import 'package:input_text/Components/Tab/tab.dart';
import 'package:input_text/Components/Tab/tab_view_model.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab page Demo"),
      ),
      body: TabComponent.instantiate(
        tabViewModel: TabViewModel(
          initialIndex: 0
        ),
      )
    );
  }
}