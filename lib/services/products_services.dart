import 'dart:convert';
import 'package:http/http.dart' as http;

// Clase que representa un producto con todos sus campos
class Product {
  final int id;                    // ID único del producto
  final String codigo;             // Código del producto
  final String nombre;             // Nombre del producto
  final String descripcion;        // Descripción del producto
  final String tipoUnidad;         // Tipo de unidad (gramos, kilos, etc.)
  final int cantidadBodega;        // Cantidad disponible en bodega
  final String? precioUnitario;    // Precio unitario (puede ser null)
  final String observacion;        // Observaciones del producto
  final int usuarioId;             // ID del usuario que creó el producto

  // Constructor de la clase Product
  Product({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.tipoUnidad,
    required this.cantidadBodega,
    this.precioUnitario,
    required this.observacion,
    required this.usuarioId,
  });

  // Factory constructor que convierte JSON a objeto Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],                                    // Extrae el ID del JSON
      codigo: json['codigo'],                           // Extrae el código
      nombre: json['nombre'],                           // Extrae el nombre
      descripcion: json['descripcion'],                 // Extrae la descripción
      tipoUnidad: json['tipo_unidad'],                  // Extrae el tipo de unidad
      cantidadBodega: json['cantidad_bodega'],          // Extrae la cantidad en bodega
      precioUnitario: json['precio_unitario']?.toString(), // Convierte precio a string (puede ser null)
      observacion: json['observacion'],                 // Extrae la observación
      usuarioId: json['usuario_id'],                    // Extrae el ID del usuario
    );
  }
}

// Función asíncrona que obtiene todos los productos de la API
Future<List<Product>> getAllProducts() async {
  // URL de la API de productos
  final url = Uri.parse('https://pucei.edu.ec:9118/api/v1/products');
  
  // Realiza la petición GET a la API
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',  // Indica que esperamos JSON como respuesta
    },
  );

  // Verifica si la petición fue exitosa (código 200)
  if (response.statusCode == 200) {
    // Decodifica el JSON de la respuesta
    final List<dynamic> jsonData = jsonDecode(response.body);
    // Convierte cada elemento JSON en un objeto Product y retorna la lista
    return jsonData.map((json) => Product.fromJson(json)).toList();
  } else {
    // Si hay un error, lanza una excepción con el código de estado
    throw Exception('Error al cargar productos: ${response.statusCode}');
  }
}
