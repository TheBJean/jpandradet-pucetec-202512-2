import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': 'Manzanas', 'icono': Icons.apple},
      {'name': 'Pan', 'icono': Icons.breakfast_dining},
      {'name': 'Leche', 'icono': Icons.local_drink},
      {'name': 'Papas', 'icono': Icons.egg},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor:Color.fromARGB(199, 0, 107, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length, 
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    leading: Icon(product['icono'] as IconData),
                    title: Text(product['name'] as String),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  );
                },
              ),
            ),
            GlobalFormButton(
              label: 'Ir a carrito',
              onTap: () => Navigator.pushNamed(context, '/cart'),
            ),
          ],
        ),
      ),
    );
  }
} 