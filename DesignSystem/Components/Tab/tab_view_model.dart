const tabNames = [
  {
    "index": "1",
    "tab": "message1"
  },
  {
    "index": "2",
    "tab": "message2"
  },
  {
    "index": "3",
    "tab": "message3"
  },
];

class TabViewModel {
  final Function(int)? onIndexChanged;
  final int initialIndex;

  TabViewModel({required this.initialIndex, this.onIndexChanged});
}
