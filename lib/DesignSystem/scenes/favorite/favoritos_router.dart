import 'package:flutter/material.dart';
import 'letra_musica.dart';

class FavoritosRouter {
  static void navigateToLetraMusica(
    BuildContext context, {
    required String artista,
    required String musica,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LetraMusica(
          artista: artista,
          musica: musica,
        ),
      ),
    );
  }
}
