enum TextSize {
  small,
  medium,
  large,
}

enum TextColor {
  primary,
  secondary,
  tertiary,
}

enum LinkedTextColor {
  primary,
  secondary,
  tertiary,
}

enum TextWeight {
  thin,
  light,
  regular,
  bold,
}

enum TextDecoration {
  none,
  underline,
  lineThrough,
}

class LinkedLabelViewModel {
  final String text;
  final String linkedText;
  final TextSize textSize;
  final TextColor textColor;
  final LinkedTextColor linkedTextColor;
  final TextWeight textWeight;
  final TextDecoration textDecoration;

  LinkedLabelViewModel({
    required this.text,
    required this.linkedText,
    required this.textSize,
    required this.textColor,
    required this.linkedTextColor,
    required this.textWeight,
    required this.textDecoration,
  });
}
