import 'package:prueba_tienda/models/products_model.dart';
import 'package:prueba_tienda/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<Product>> products(ProductsRef ref) async {
  try {
    final List<Product>? products = await Repository().fetchProducts();
    return products!;
  } catch (e) {
    throw Exception('Error al cargar los productos: $e');
  }
}
