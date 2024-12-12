import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login_router.dart';
import 'login_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Digite os dados de acesso nos campos abaixo.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const CupertinoTextField(
              cursorColor: Colors.pinkAccent,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              padding: EdgeInsets.all(15),
              cursorColor: Colors.pinkAccent,
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: Colors.greenAccent,
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 0.8),
                  borderRadius: BorderRadius.circular(7)),
              child: CupertinoButton(
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () async {
                  try {
                    // Chama o método estático fetchLogin e obtém os dados do usuário
                    var emailController;
                    var passwordController;
                    Map<String, dynamic> userData = await LoginService.fetchLogin(
                      emailController.text,
                      passwordController.text,
                    );

                    // Navega para a ProfilePage usando o LoginRouter e passa os dados do usuário
                    // ignore: use_build_context_synchronously
                    LoginRouter.goToProfilePage(context, userData);
                  } catch (e) {
                    // Lida com o erro (por exemplo, exibindo uma mensagem ao usuário)
                    print('Erro ao fazer login: $e');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}