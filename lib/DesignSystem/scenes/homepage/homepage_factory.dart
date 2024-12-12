import 'package:flutter/material.dart';
import 'homepage.dart';

class HomePageFactory {
  /// Método para criar a homepage com os dados do usuário
  static Widget create({required Map<String, dynamic> userData}) {
    return MyHomePage(userData: userData);
  }
}
