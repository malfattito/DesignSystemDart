// lib/config/app_config.dart

import 'package:flutter/material.dart';
import '../designsystem/screen/home_screen.dart'; //Importar Tela

class MyAppConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sicredi',  
      theme: ThemeData(
        primarySwatch: Colors.green, 
      ),
      home: HomeScreen(),  
    );
  }
}
