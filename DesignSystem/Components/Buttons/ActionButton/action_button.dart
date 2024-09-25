import 'package:flutter/material.dart';
import 'package:input_text/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:input_text/shared/colors.dart';
import 'package:input_text/shared/styles.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 32;
    double verticalPadding = 12;
    double iconSize = 24;
    TextStyle buttonTextStyle = button3Semibold;
    Color buttonColor = lightPrimaryBrandColor;

    switch (viewModel.size) {
      case ActionButtonSize.large:
        buttonTextStyle = button1Bold;
        iconSize = 24;
        break;
      case ActionButtonSize.medium:
        buttonTextStyle = button2Semibold;
        iconSize = 24;
        break;
      case ActionButtonSize.small:
        buttonTextStyle = button3Semibold;
        horizontalPadding = 16;
        iconSize = 16;
        break;
      default:
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        buttonColor = lightPrimaryBrandColor;
        break;
      case ActionButtonStyle.secondary:
        buttonColor = lightSecondaryBrandColor;
        break;
      case ActionButtonStyle.tertiary:
        buttonColor = lightTertiaryBrandColor;
        break;
      default:
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: buttonTextStyle,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding
        )
      ),
      child: viewModel.icon !=null ?
      Row(
        children: [
          Icon(
            viewModel.icon,
            size: iconSize,
          ),
          Text(viewModel.text)
        ],
      ) :
      Text(viewModel.text),
    );
  }
}