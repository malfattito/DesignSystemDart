import 'package:flutter/material.dart';
import '../Components/LinkedLabel/linked_label.dart';


class LinkedLabelSampleScreen extends StatelessWidget {
  const LinkedLabelSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkedLabel'),
      ),
      body: LinkedLabel(
        text: 'I have read and agree ', 
        linkText: 'Terms & Services',
        url: 'https://www.your-terms-and-services-url.com',
        onChanged: (bool? value) {
          if (value != null && value){
            print('Checkbox marcada');
          } else {
            print('Checkbox desmarcado');
          }
        },
      ),
    );
  }
}