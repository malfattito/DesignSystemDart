import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_package_1/DesignSystem/scenes/homepage/providers.dart';
import 'package:flutter_package_1/DesignSystem/scenes/login/login.dart'; 

void main() {
  runApp(
    // Adicionando o Provider no topo da árvore
    ChangeNotifierProvider(
      create: (_) => Providers(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music-letters',
      theme: ThemeData.light(),
      home: const LoginPage(), // Página inicial
    );
  }
}
