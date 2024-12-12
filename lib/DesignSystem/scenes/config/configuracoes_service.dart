import 'package:flutter/material.dart';
import 'package:flutter_package_1/DesignSystem/scenes/homepage/providers.dart';

class ConfiguracoesService {
  static bool isDarkTheme(Providers provider) {
    return provider.currentTheme == ThemeData.dark();
  }

  static void toggleTheme(Providers provider) {
    provider.toggleTheme();
  }

  static void changeLanguage(Providers provider, String? newLanguage) {
    if (newLanguage != null) {
      provider.setLanguage(newLanguage);
    }
  }

  static List<String> getLanguageOptions() {
    return ['en', 'pt', 'es'];
  }

  static String getLanguageText(String value) {
    switch (value) {
      case 'en':
        return 'English';
      case 'pt':
        return 'Português';
      case 'es':
        return 'Español';
      default:
        return value.toUpperCase();
    }
  }
}
