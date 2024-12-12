import 'package:flutter/material.dart';
import 'musica.dart';

class Providers with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  String _selectedLanguage = 'en';
  final List<Musica> _favoritos = [];

  // Getters
  ThemeData get currentTheme => _currentTheme;
  String get selectedLanguage => _selectedLanguage;
  List<Musica> get favoritos => _favoritos;

  final List<String> _downloads = [];

  List<String> get downloads => _downloads;

  // Setters
  set currentTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  set selectedLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  // Método para alternar entre tema claro e escuro
  void toggleTheme() {
    _currentTheme = (_currentTheme == ThemeData.light()) ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  // Alterar o idioma
  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  // Adicionar música aos favoritos
  void adicionarFavorito(Musica musica) {
    // Verifica se a música já está na lista de favoritos
    if (!_favoritos.contains(musica)) {
      _favoritos.add(musica);
      notifyListeners();
    }
  }

  // Remover música dos favoritos
  void removerFavorito(Musica musica) {
    if (_favoritos.contains(musica)) {
      _favoritos.remove(musica);
      notifyListeners();
    }
  }

  void adicionarDownload(String title) {
    _downloads.add(title);
    notifyListeners();
  }

  void removerDownload(int index) {
    _downloads.removeAt(index);
    notifyListeners();
  }
}
