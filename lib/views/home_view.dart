import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido a Grocery Store :D',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(214, 15, 159, 164)
                ),
                textAlign: TextAlign.center,
                
              ),
              const SizedBox(height: 32.0),
              GlobalFormButton(
                label: 'Ir a productos',
                onTap: () => Navigator.pushNamed(context, '/products'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}