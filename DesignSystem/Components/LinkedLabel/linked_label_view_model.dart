class LinkedLabelViewModel {
  final String fullText;
  final String linkedText;
  final Function()? onLinkTap;

  LinkedLabelViewModel({
    required this.fullText,
    required this.linkedText,
    required this.onLinkTap
  });
}