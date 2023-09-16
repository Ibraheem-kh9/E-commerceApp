import 'dart:io';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/repo/api_status.dart';
import 'package:http/http.dart' as http;
import '../utils/constants/constants_link.dart';

class ProductsServices {
  Future<Object> fetchProducts() async {
    try {
      final url = Uri.parse(productListLink);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
            code: 200, response: productModelFromJson(response.body));
      }

      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 103, errorResponse: e);
    }
  }
}
