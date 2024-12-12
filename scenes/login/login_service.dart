import 'dart:async';

class LoginService {
  static Future<Map<String, dynamic>> fetchLogin(String usr, String pwd) async {
    // Simula um delay de 2 segundos para representar o tempo de resposta da API
    await Future.delayed(const Duration(seconds: 2));

    // Aqui você pode adicionar lógica para validar o usuário e a senha

    // Simula uma resposta da API com dados fictícios do usuário
    Map<String, dynamic> response = {
      'name': 'João Silva',
      'email': 'joao.silva@example.com',
      'phone': '+55 11 91234-5678',
    };

    // Retorna a resposta como um mapa (JSON)
    return response;
  }
}
