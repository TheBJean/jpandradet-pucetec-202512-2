// Importaciones necesarias para Flutter y nuestros widgets personalizados
import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';
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
            // Estado inicial: cuando no hay productos cargados y no está cargando
            if (products.isEmpty && !isLoading && errorMessage == null)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icono de inventario
                      Icon(
                        Icons.inventory_2,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      // Texto principal
                      Text(
                        'No hay productos cargados',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Texto secundario con instrucciones
                      Text(
                        'Presiona el botón para cargar los productos',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            
            // Estado de carga: muestra un spinner mientras se cargan los datos
            if (isLoading)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),  // Indicador de carga circular
                      const SizedBox(height: 16),
                      Text('Cargando productos...'),
                    ],
                  ),
                ),
              ),

            // Estado de error: muestra un mensaje de error si algo falla
            if (errorMessage != null)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icono de error
                      Icon(
                        Icons.error_outline,
                        size: 80,
                        color: Colors.red[400],
                      ),
                      const SizedBox(height: 16),
                      // Título del error
                      Text(
                        'Error al cargar productos',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Mensaje de error específico
                      Text(
                        errorMessage!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red[500],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

            // Lista de productos: se muestra cuando hay productos cargados
            if (products.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,  // Número total de productos
                  itemBuilder: (context, index) {
                    final product = products[index];  // Producto actual
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),  // Margen entre cards
                      child: ListTile(
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
                  },
                ),
              ),

            const SizedBox(height: 16),  // Espacio antes de los botones
            
            // Botón "Mostrar Productos": solo aparece cuando no hay productos cargados
            if (products.isEmpty && !isLoading)
              GlobalFormButton(
                label: 'Mostrar Productos',
                onTap: loadProducts,  // Llama a la función para cargar productos
              ),
            
            // Botón "Ir a carrito": solo aparece cuando hay productos cargados
            if (products.isNotEmpty)
              GlobalFormButton(
                label: 'Ir a carrito',
                onTap: () => Navigator.pushNamed(context, '/cart'),  // Navega al carrito
              ),
          ],
        ),
      ),
    );
  }
} 