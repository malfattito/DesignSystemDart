import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageService {
  static Future<String?> fetchLyrics(BuildContext context, String artist, String song) async {
    try {
      // Monta a URL para a requisição à API Lyrics.ovh
      final url = Uri.parse(
        'https://api.lyrics.ovh/v1/$artist/$song',  // A URL da API
      );

      print('URL requisitada: $url');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Verifica se a letra foi encontrada
        if (data.containsKey('lyrics')) {
          return data['lyrics'];
        } else {
          return 'Letra não encontrada.';
        }
      } else {
        return 'Erro ao fazer a requisição.';
      }
    } catch (e) {
      print('Erro durante a requisição HTTP: $e');
      return 'Erro ao buscar a letra.';
    }
  }
}
