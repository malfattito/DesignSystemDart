import 'package:flutter/material.dart';
import 'package:flutter_package_1/DesignSystem/scenes/config/configuracoes_page.dart'; // Substitua pelo caminho real
import 'package:flutter_package_1/DesignSystem/scenes/favorite/favoritos_page.dart'; // Substitua pelo caminho real
import 'package:flutter_package_1/DesignSystem/scenes/downloads/downloads_page.dart';

class HomePageRouter {
  static Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Opções',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Configuracoes()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Favoritos()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Downloads'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadPage()));
            },
          ),
        ],
      ),
    );
  }
}
