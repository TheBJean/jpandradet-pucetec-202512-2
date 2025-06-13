import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        backgroundColor:Color.fromARGB(230, 16, 187, 28),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total: \$123.12',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32.0),
              GlobalFormButton(
                label: 'Realizar Compra',
                onTap: () => Navigator.pushNamed(context, '/confirmation'),
              ),
            ],
          ),
        
      ),
    );
  }
} 