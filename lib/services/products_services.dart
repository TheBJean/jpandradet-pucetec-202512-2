import 'package:flutter_intro/models/product_model.dart';
import 'package:flutter_intro/utils/api_utils.dart';
import 'dart:convert';

class ProductsService {
  Future<List<ProductModel>> fetchProductsByUser(int usuarioId) async {
    final response = await ApiUtil.get('/productos');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => ProductModel.fromJson(item))
          .where((product) => product.usuarioId == usuarioId)
          .toList();
    } else {
      throw Exception('Error al obtener productos');
    }
  }
}

