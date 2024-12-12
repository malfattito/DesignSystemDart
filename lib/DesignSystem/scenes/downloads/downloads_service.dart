import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DownloadScreen extends StatefulWidget {
  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  String _statusMessage = "Digite a URL e inicie o download";

  Future<void> _downloadVideo(String videoUrl) async {
    setState(() {
      _statusMessage = "Iniciando o download...";
    });

    try {
      final Map<String, dynamic> result = await downloadVideo(videoUrl);
      
      if (result.containsKey('message')) {
        setState(() {
          _statusMessage = 'Download concluído: ${result['title']}';
        });
      } else if (result.containsKey('error')) {
        setState(() {
          _statusMessage = 'Erro: ${result['error']}';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'Erro ao conectar ao servidor: $e';
      });
    }
  }

  Future<Map<String, dynamic>> downloadVideo(String videoUrl) async {
    final Uri uri = Uri.parse('http://127.0.0.1:5000/API').replace(queryParameters: {
      'url': videoUrl,
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao realizar o download: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController urlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Download de Vídeo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                labelText: 'URL do vídeo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (urlController.text.isNotEmpty) {
                  _downloadVideo(urlController.text);
                }
              },
              child: Text('Iniciar Download'),
            ),
            SizedBox(height: 20),
            Text(_statusMessage, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
