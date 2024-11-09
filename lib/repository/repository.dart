import 'package:dio/dio.dart';
import 'package:prueba_tienda/models/products_model.dart';

const String baseUrl = "https://fakestoreapi.com/";

class Repository {
  Future<List<Product>?> fetchProducts() async {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    try {
      var response = await dio.get('/products');
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        return jsonResponse.map((e) => Product.fromJson(e)).toList();
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw Exception("El endpoint está mal configurado $e");
    } on FormatException catch (e) {
      throw Exception("Error por formato $e");
    }
  }
}
