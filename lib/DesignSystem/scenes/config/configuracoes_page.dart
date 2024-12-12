import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_package_1/DesignSystem/scenes/homepage/providers.dart';
import 'configuracoes_service.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<Providers>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Configurações'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20), // Espaço entre a AppBar e o conteúdo
          ListTile(
            title: const Text('Modo Noturno'),
            trailing: Switch(
              value: ConfiguracoesService.isDarkTheme(settingsProvider),
              onChanged: (value) {
                ConfiguracoesService.toggleTheme(settingsProvider);
              },
            ),
          ),
          ListTile(
            title: const Text('Idioma'),
            trailing: DropdownButton<String>(
              value: settingsProvider.selectedLanguage,
              onChanged: (String? newLanguage) {
                ConfiguracoesService.changeLanguage(settingsProvider, newLanguage);
              },
              items: ConfiguracoesService.getLanguageOptions().map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(ConfiguracoesService.getLanguageText(value)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
