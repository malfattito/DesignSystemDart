import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_package_1/DesignSystem/scenes/homepage/providers.dart';
import 'favoritos_router.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<Providers>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: settingsProvider.favoritos.length,
        itemBuilder: (context, index) {
          final musica = settingsProvider.favoritos[index];
          return ListTile(
            title: Text('${musica.artista} - ${musica.titulo}'),
            onTap: () {
              FavoritosRouter.navigateToLetraMusica(
                context,
                artista: musica.artista,
                musica: musica.titulo,
              );
            },
          );
        },
      ),
    );
  }
}
