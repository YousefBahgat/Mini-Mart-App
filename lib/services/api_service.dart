import 'package:dio/dio.dart';
import '../models/product.dart';

class ApiService {
  final Dio _dio = Dio();

  // Fetch All Products using get request
  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
    if (response.statusCode == 400) {
      throw Exception('Failed to Fetch Data');
    }
    return (response.data as List).map((product) {
      return Product.fromJson(product);
    }).toList();
  }

  // Get the product by id if needed
  Future<Product> fetchProductById(int id) async {
    final response = await _dio.get('https://fakestoreapi.com/products/$id');
    if (response.statusCode == 400) {
      throw Exception('Failed to Fetch Data');
    }
    return Product.fromJson(response.data);
  }
}
