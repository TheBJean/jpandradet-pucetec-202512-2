import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmacion'),
        backgroundColor:Color.fromARGB(230, 141, 225, 5),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Compra hecha con exito',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              GlobalFormButton(
                label: 'Ir a inicio',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                ),
              ),
            ],
          ),
        
      ),
    );
  }
} 