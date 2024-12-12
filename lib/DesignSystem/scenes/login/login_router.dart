import 'package:flutter/material.dart';
import 'package:flutter_package_1/DesignSystem/scenes/homepage/homepage_factory.dart';

class LoginRouter {
  /// Método para navegar da página de login para a homepage
  static void goToHomePage(BuildContext context, Map<String, dynamic> userData) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePageFactory.create(userData: userData),
      ),
    );
  }
}
