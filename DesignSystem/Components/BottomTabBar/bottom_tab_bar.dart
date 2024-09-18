import 'package:flutter/material.dart';
import 'package:input_text/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:input_text/shared/colors.dart';

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
<<<<<<< HEAD
  const BottomTabBar._({super.key, required this.viewModel});

  static Widget instantiate({required BottomTabBarViewModel viewModel}) {
    return BottomTabBar._(viewModel: viewModel);
=======
  final int currentIndex;

  const BottomTabBar._({super.key, required this.viewModel, required this.currentIndex}); // Atualizei aqui

  static Widget instantiate({required BottomTabBarViewModel viewModel, required int currentIndex}) {
    return BottomTabBar._(viewModel: viewModel, currentIndex: currentIndex); // Atualizei aqui
>>>>>>> cb30d350a501e81327cbb3fa142b6057584eaf2f
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: darkPrimaryBrandColor,
      unselectedItemColor: lightPrimaryBaseColorLight,
      showUnselectedLabels: true,
<<<<<<< HEAD
=======
      currentIndex: currentIndex,
>>>>>>> cb30d350a501e81327cbb3fa142b6057584eaf2f
      onTap: viewModel.onIndexChanged,
    );
  }
}