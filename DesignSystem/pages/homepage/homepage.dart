import 'package:flutter/material.dart';
import 'package:input_text/Components/Buttons/ActionButton/action_button.dart';
import 'package:input_text/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:input_text/pages/actionButtonPage/action_button_page.dart';
import 'package:input_text/pages/bottomTabBarPage/bottom_tab_bar_page.dart';
import 'package:input_text/pages/inputFieldPage/input_field_page.dart';
import 'package:input_text/pages/linkedLabelPage/linked_label_page.dart';
import 'package:input_text/pages/tabPage/tab_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Buttons page"),
            ActionButton.instantiate(viewModel: 
              ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: 'Button',
                icon: Icons.navigate_next_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ActionButtonPage()
                    )
                  );
                }
              )
            ),
            const SizedBox(height: 20,),
            const Text("Input Field page"),
            ActionButton.instantiate(viewModel: 
              ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: 'Input',
                icon: Icons.navigate_next_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputFieldPage()
                    )
                  );
                }
              )
            ),
            const SizedBox(height: 20,),
            const Text("Tab Component page"),
            ActionButton.instantiate(viewModel: 
              ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: 'Tab',
                icon: Icons.navigate_next_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TabPage()
                    )
                  );
                }
              )
            ),
            const SizedBox(height: 20,),
            const Text("Linked Label page"),
            ActionButton.instantiate(viewModel: 
              ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: 'Linked Label',
                icon: Icons.navigate_next_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LinkedLabelPage()
                    )
                  );
                }
              )
            ),
            const SizedBox(height: 20,),
            const Text("Bottom tab bar page"),
            ActionButton.instantiate(viewModel: 
              ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: 'Bottom Tab Bar',
                icon: Icons.navigate_next_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomTabBarPage()
                    )
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}