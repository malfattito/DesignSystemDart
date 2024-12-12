import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  final TextEditingController _urlController = TextEditingController();
  String _statusMessage = '';

  // Função para fazer a requisição GET para o Flask
  Future<void> downloadVideo(String videoUrl) async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:5000/download?url=$videoUrl'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _statusMessage = 'Download concluído: ${data['title']}';
      });
    } else {
      setState(() {
        _statusMessage = 'Falha no download: ${response.body}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download de Vídeo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de texto para inserir a URL
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'URL do vídeo',
                hintText: 'Cole a URL do YouTube',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Botão para acionar o download
            ElevatedButton(
              onPressed: () {
                String url = _urlController.text;
                if (url.isNotEmpty) {
                  downloadVideo(url);
                } else {
                  setState(() {
                    _statusMessage = 'Por favor, insira a URL.';
                  });
                }
              },
              child: Text('Baixar Vídeo'),
            ),
            SizedBox(height: 16.0),

            // Exibição da mensagem de status
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 16.0,
                color: _statusMessage.contains('Falha') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
