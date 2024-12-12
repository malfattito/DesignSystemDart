import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfilePage({super.key, required this.userData});

  static Widget create({required Map<String, dynamic> userData}) {
    return ProfilePage(userData: userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${userData['name']}'),
            Text('Email: ${userData['email']}'),
            Text('Telefone: ${userData['phone']}'),
          ],
        ),
      ),
    );
  }
}
