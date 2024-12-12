import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LetraMusica extends StatefulWidget {
  final String artista;
  final String musica;

  const LetraMusica({required this.artista, required this.musica, Key? key}) : super(key: key);

  @override
  _LetraMusicaState createState() => _LetraMusicaState();
}

class _LetraMusicaState extends State<LetraMusica> {
  String? _letra;
  bool _isLoading = false;
  final String apiKey = 'ca4eb4f31078ec597e1b4fe72ece830f'; // Substitua pela sua chave da API

  @override
  void initState() {
    super.initState();
    _fetchLyrics(widget.artista, widget.musica);
  }

  Future<void> _fetchLyrics(String artist, String song) async {
    setState(() {
      _isLoading = true;
    });

    try {
      var response = await http.get(
        Uri.parse('https://api.vagalume.com.br/search.php?art=$artist&mus=$song&apikey=$apiKey'),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['type'] == 'exact' || data['type'] == 'aprox') {
          setState(() {
            _letra = data['mus'][0]['text'];
          });
        } else {
          setState(() {
            _letra = 'Letra não encontrada.';
          });
        }
      } else {
        print('Falha ao chamar API do Vagalume: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição HTTP: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.artista} - ${widget.musica}'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _letra != null
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Text(
                        _letra!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Text('Letra não encontrada.'),
      ),
    );
  }
}
