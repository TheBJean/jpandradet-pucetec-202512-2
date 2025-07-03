import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_intro/bloc/login_bloc/login_event.dart';
import 'package:flutter_intro/bloc/login_bloc/login_state.dart';
import '../widgets/global_form_text.dart';
import '../widgets/global_form_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usuarioController = TextEditingController();
    final TextEditingController contrasenaController = TextEditingController();
    final loginBloc = context.read<LoginBloc>();

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>( 
        listener: (context, state) {
          if (state.usuario != null && state.token  != null) {
            
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        bloc: loginBloc,
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
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Container(
                    child: state.isLoading == true 
                        ? const CircularProgressIndicator() 
                        : GlobalFormButton(
                            label: 'Iniciar sesión',
                            onTap: () async {
                              loginBloc.add(LoginSubmitEvent(
                                usuario: usuarioController.text,
                                password: contrasenaController.text,
                              ));
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}