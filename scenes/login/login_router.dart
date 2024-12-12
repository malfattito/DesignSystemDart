import 'package:flutter/material.dart';
import 'package:flutter_package_1/DesignSystem/scenes/profile/profile_page.dart';

class LoginRouter {
  static void goToProfilePage(BuildContext context, Map<String, dynamic> userData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage.create(userData: userData),
      ),
    );
  }
}
