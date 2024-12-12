import 'package:flutter_package_1/DesignSystem/scenes/homepage/providers.dart';
import 'package:flutter_package_1/DesignSystem/scenes/homepage/musica.dart';

class FavoritosService {
  static List<Musica> getFavoritos(Providers provider) {
    return provider.favoritos;
  }
}
