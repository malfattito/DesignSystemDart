import 'package:untitled/DesignSystem/Components/BottomNavigationBar/botton_navigation_view_model.dart';
import 'package:untitled/DesignSystem/Components/BottomNavigationBar/botton_navitation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          appBar: AppBar(
            title: const Center(
              child: Text('home'),
            ),
            bottom: const CustomNavigationBar(),
          ),
          body: const CustomNavigationBarView(),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/NavigationBar/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}*/


/*
import 'package:untitled/DesignSystem/Components/Tab_bar/custom_tab_bar.dart';
import 'package:untitled/DesignSystem/Components/Tab_bar/custom_tab_bar_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          appBar: AppBar(
            title: const Center(
              child: Text('home'),
            ),
            bottom: const CustomTabBar(),
          ),
          body: const CustomTabBarView(),
        ),
      ),
    );
  }
}
*/

/* temporário: usar para testar o input_text'
import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Input_text/my_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}

*/


