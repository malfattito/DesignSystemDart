import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:input_text/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:input_text/shared/colors.dart';
import 'package:input_text/shared/styles.dart';

class LinkedLabel extends StatelessWidget {
  final LinkedLabelViewModel viewModel;

  const LinkedLabel._({super.key, required this.viewModel});

  static Widget instantiate({required LinkedLabelViewModel viewModel}) {
    return LinkedLabel._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {

    final int startIndex = viewModel.fullText.indexOf(viewModel.linkedText);
    final int endIndex = startIndex + viewModel.linkedText.length;

    if (startIndex == -1) {
      return Text(viewModel.fullText);
    }

    return RichText(
      text: TextSpan(
        text: viewModel.fullText.substring(0, startIndex),
        style: label2Semibold,
        children: [
          TextSpan(
            text: viewModel.linkedText,
            style: const TextStyle(color: normalSecondaryBrandColor),
            recognizer: TapGestureRecognizer()..onTap = viewModel.onLinkTap,
          ),
          TextSpan(
            text: viewModel.fullText.substring(endIndex),
            style: label2Semibold,
          ),
        ],
      ),
    );
  }
}