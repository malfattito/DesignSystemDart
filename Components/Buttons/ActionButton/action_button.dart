import 'package:flutter/material.dart';
import 'package:input_text/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:input_text/shared/colors.dart';
import 'package:input_text/shared/styles.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._(this.viewModel, {Key? key}) : super(key: key);

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = _getButtonColor(viewModel.style);
    final textStyle = _getTextStyle(viewModel.size);
    final padding = _getPadding(viewModel.size);

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: textStyle,
        padding: padding,
      ),
      child: _buildButtonContent(),
    );
  }

  Color _getButtonColor(ActionButtonStyle style) {
    switch (style) {
      case ActionButtonStyle.primary:
        return lightPrimaryBrandColor;
      case ActionButtonStyle.secondary:
        return lightSecondaryBrandColor;
      case ActionButtonStyle.tertiary:
        return lightTertiaryBrandColor;
    }
  }

  TextStyle _getTextStyle(ActionButtonSize size) {
    switch (size) {
      case ActionButtonSize.large:
        return button1Bold;
      case ActionButtonSize.medium:
        return button2Semibold;
      case ActionButtonSize.small:
        return button3Semibold;
    }
  }

  EdgeInsets _getPadding(ActionButtonSize size) {
    return size == ActionButtonSize.small
        ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
        : const EdgeInsets.symmetric(vertical: 12, horizontal: 32);
  }

  Widget _buildButtonContent() {
    return viewModel.icon != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(viewModel.icon, size: 24),
              const SizedBox(width: 8),
              Text(viewModel.text),
            ],
          )
        : Text(viewModel.text);
  }
}
