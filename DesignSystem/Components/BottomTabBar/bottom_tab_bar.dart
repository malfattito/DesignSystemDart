import 'package:flutter/material.dart';
import 'package:input_text/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:input_text/shared/colors.dart';

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  const BottomTabBar._({super.key, required this.viewModel});

  static Widget instantiate({required BottomTabBarViewModel viewModel}) {
    return BottomTabBar._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: darkPrimaryBrandColor,
      unselectedItemColor: lightPrimaryBaseColorLight,
      showUnselectedLabels: true,
      onTap: viewModel.onIndexChanged,
    );
  }
}