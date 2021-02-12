import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/shared/configuration/configuration_wp.dart';
import 'package:minha_loja/app/shared/models/product_model.dart';

part 'product_repository.g.dart';

@Injectable()
class ProductRepository extends Disposable {
  final Dio _dio;

  ProductRepository(this._dio);

  Future<List<ProductModel>> getProducts(String tagId) async {
    try {
      var response = await _dio.get(ConfigurationWp.productsUrl +
          "?consumer_key=${ConfigurationWp.key}&consumer_secret=${ConfigurationWp.secret}&tag=$tagId");

      return (response.data as List)
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
    } on DioError catch (e) {
      print(e.response);
      throw Exception(e.error.toString());
    }
  }

  @override
  void dispose() {}
}
