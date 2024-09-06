import 'package:flutter/material.dart';
import 'package:input_text/Components/Tab/tab_view_model.dart';
import 'package:input_text/shared/colors.dart';

class TabComponent extends StatefulWidget {
  final TabViewModel tabViewModel;

  const TabComponent._({super.key, required this.tabViewModel});

  @override
  State<TabComponent> createState() => _TabComponentState();

  static Widget instantiate({required TabViewModel tabViewModel}) {
    return TabComponent._(tabViewModel: tabViewModel);
  }
}

class _TabComponentState extends State<TabComponent>
  with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: tabNames.length,
        vsync: this,
        initialIndex: widget.tabViewModel.initialIndex);
    tabController.addListener(handleTabChange);
  }

  void handleTabChange() {
    if (tabController.indexIsChanging) {
      widget.tabViewModel.onIndexChanged?.call(tabController.index);
    }
  }

  @override
  void dispose() {
    tabController.removeListener(handleTabChange);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: tabNames.map((e) => Tab(
            text: "Tab ${e['index']}"
          )).toList(),
          indicatorColor: lightPrimaryBrandColor,
          labelColor: lightPrimaryBrandColor,
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: tabNames.map((e) {
              return Center(
                child: Text((e['tab'] ?? 'Sem conteudis')),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
