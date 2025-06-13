import 'package:flutter/material.dart';
import '../widgets/global_form_text.dart';
import '../widgets/global_form_button.dart';
import '../services/login.service.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usuarioController = TextEditingController();
    final TextEditingController contrasenaController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Grocery Store',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(215, 0, 0, 233),
                ),
              ),
              const SizedBox(height: 32.0),
              GlobalFormText(
                label: 'Usuario',
                controller: usuarioController,
              ),
              const SizedBox(height: 16.0),
              GlobalFormText(
                label: 'Contraseña',
                obscureText: true,
                controller: contrasenaController,
              ),
              const SizedBox(height: 24.0),
              GlobalFormButton(
                label: 'Iniciar sesión',
                onTap: () async {
                  try {
                    String response = await login(usuarioController.text, contrasenaController.text);
                    print("Login exitoso: $response");
                  } catch (e) {
                    print("Error al iniciar sesión: $e");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}