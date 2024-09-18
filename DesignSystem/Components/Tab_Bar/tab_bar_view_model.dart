class TabBarViewModel {
  final List<String> tabs;
  int selectedIndex;

  TabBarViewModel({required this.tabs, this.selectedIndex = 0});

  void selectTab(int index) {
    selectedIndex = index;
  }
}