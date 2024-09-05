// lib/DesignSystem/Samples/sample_screens_home.dart
import 'package:flutter/material.dart';
import 'action_button_sample_screen.dart';
import 'nav_bar_sample_screen.dart';
import 'text_field_enabled_sample_screen.dart';
import 'linked_label_sample_screen.dart';

class SampleScreensHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Screens Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActionButtonSampleScreen()),
                );
              },
              child: Text('Action Button Sample Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavBarSampleScreen()),
                );
              },
              child: Text('Nav Bar Sample Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextFieldSampleScreen()),
                );
              },
              child: Text('Text Field Enabled Sample Screen'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LinkedLabelSampleScreen()),
                );
              }, 
              child: const Text('Linked Label')
            )
          ],
        ),
      ),
    );
  }
}