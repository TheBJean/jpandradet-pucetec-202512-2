import 'package:flutter/material.dart';
import '../services/products_services.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),  // Margen entre cards
      child: ListTile(
        onTap: onTap,
        // Avatar circular con la primera letra del nombre del producto
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(199, 0, 107, 238),
          child: Text(
            product.nombre[0].toUpperCase(),  // Primera letra en mayúscula
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Título del producto
        title: Text(
          product.nombre,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // Información detallada del producto
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${product.codigo}'),                    // Código del producto
            Text('Descripción: ${product.descripcion}'),         // Descripción
            Text('Unidad: ${product.tipoUnidad}'),               // Tipo de unidad de medida
            Text('Cantidad disponible: ${product.cantidadBodega} productos'),  // Cantidad de productos en bodega
            if (product.precioUnitario != null)                  // Precio (solo si existe)
              Text('Precio: \$${product.precioUnitario}'),
            Text('Observación: ${product.observacion}'),         // Observaciones
            Text('Creado por: Usuario ${product.usuarioId}'),    // Usuario que creó el producto
          ],
        ),
        isThreeLine: true,  // Permite múltiples líneas en el subtitle
        trailing: Text(
          'ID: ${product.id}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),  // ID del producto a la derecha
      ),
    );
  }
} 