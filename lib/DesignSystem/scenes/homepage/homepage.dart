import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage_service.dart';
import 'homepage_router.dart';
import 'providers.dart';
import 'musica.dart';

class MyHomePage extends StatefulWidget {
  final Map<String, dynamic> userData; // Adiciona o campo para armazenar os dados do usuário

  const MyHomePage({Key? key, required this.userData}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  String? _letra;
  bool _isLoading = false;

  Future<void> _fetchLyrics(String artist, String song) async {
    setState(() {
      _isLoading = true;
    });

    _letra = await HomePageService.fetchLyrics(context, artist, song);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<Providers>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Nerd Music'),
      ),
      drawer: HomePageRouter.buildDrawer(context),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Pesquisar música',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String searchTerm = _searchController.text;
                  List<String> terms = searchTerm.split(" - ");
                  if (terms.length == 2) {
                    String artist = terms[0];
                    String song = terms[1];
                    await _fetchLyrics(artist, song);

                    settingsProvider.adicionarFavorito(
                      Musica(artista: artist, titulo: song, letra: _letra ?? ''),
                    );
                  } else {
                    print("Formato de pesquisa inválido. Use 'Artista - Música'.");
                  }
                },
                child: const Text('Pesquisar'),
              ),
              if (_isLoading)
                const CircularProgressIndicator(),
              if (_letra != null)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Text(
                        _letra!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
