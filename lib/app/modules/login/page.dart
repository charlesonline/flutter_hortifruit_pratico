import 'package:app_hortifruit_pratico/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Acesso')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [

              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (String? value) {
                  if (value != null && value.isNotEmpty) {
                    if (!value.contains('@')) {
                      return 'Email inválido!';
                    }
                  }

                  return null;
                },
              ),

              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                obscureText: true,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Informe a sua senha';
                  }

                  return null;
                },
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ElevatedButton(
                        onPressed: controller.login, 
                        child: const Text("Entrar")
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: OutlinedButton(
                        onPressed: () {}, 
                        child: const Text("Criar conta")
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ));
  }
}
