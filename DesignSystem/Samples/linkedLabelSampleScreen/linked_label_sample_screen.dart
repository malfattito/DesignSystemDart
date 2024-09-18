import 'package:flutter/material.dart';
import 'package:input_text/Components/LinkedLabel/linked_label.dart';
import 'package:input_text/Components/LinkedLabel/linked_label_view_model.dart';

class LinkedLabelPage extends StatelessWidget {
  const LinkedLabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linked Label Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "texto com link",
                linkedText: "com link",
                onLinkTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}