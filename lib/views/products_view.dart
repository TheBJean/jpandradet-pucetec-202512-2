// Importaciones necesarias para Flutter y nuestros widgets personalizados
import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';
import '../widgets/product_card.dart';
import '../widgets/state_widgets.dart';
import '../services/products_services.dart';

// Widget de estado que maneja la pantalla de productos
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

// Estado privado de la pantalla de productos
class _ProductsScreenState extends State<ProductsScreen> {
  // Lista que almacena los productos cargados desde la API
  List<Product> products = [];
  // Variable que indica si se está cargando datos
  bool isLoading = false;
  // Mensaje de error si algo falla
  String? errorMessage;

  // Función asíncrona que carga los productos desde la API
  Future<void> loadProducts() async {
    // Actualiza el estado para mostrar el indicador de carga
    setState(() {
      isLoading = true;
      errorMessage = null;  // Limpia cualquier error anterior
    });

    try {
      // Llama al servicio para obtener los productos
      final loadedProducts = await getAllProducts();
      // Actualiza el estado con los productos cargados
      setState(() {
        products = loadedProducts;
        isLoading = false;
      });
    } catch (e) {
      // Si hay un error, actualiza el estado con el mensaje de error
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void _showProductDetails(Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product.nombre),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Código: ${product.codigo}'),
              Text('Descripción: ${product.descripcion}'),
              Text('Unidad: ${product.tipoUnidad}'),
              Text('Stock: ${product.cantidadBodega}'),
              if (product.precioUnitario != null)
                Text('Precio: \$${product.precioUnitario}'),
              Text('Observación: ${product.observacion}'),
              Text('Usuario ID: ${product.usuarioId}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior de la aplicación
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Color.fromARGB(199, 0, 107, 238),  // Color azul personalizado
      ),
      // Cuerpo principal de la pantalla
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contenido principal
            Expanded(
              child: _buildContent(),
            ),
            
            const SizedBox(height: 16),
            
            // Botones de acción
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const LoadingStateWidget();
    }
    
    if (errorMessage != null) {
      return ErrorStateWidget(errorMessage: errorMessage!);
    }
    
    if (products.isEmpty) {
      return const EmptyStateWidget(
        title: 'No hay productos cargados',
        subtitle: 'Presiona el botón para cargar los productos',
      );
    }
    
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onTap: () => _showProductDetails(products[index]),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    if (products.isEmpty && !isLoading) {
      return GlobalFormButton(
        label: 'Mostrar Productos',
        onTap: loadProducts,
      );
    }
    
    if (products.isNotEmpty) {
      return GlobalFormButton(
        label: 'Ir a carrito',
        onTap: () => Navigator.pushNamed(context, '/cart'),
      );
    }
    
    return const SizedBox.shrink();
  }
} 