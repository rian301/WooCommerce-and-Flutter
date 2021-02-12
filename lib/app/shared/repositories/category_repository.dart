import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/shared/configuration/configuration_wp.dart';
import 'package:minha_loja/app/shared/models/category_model.dart';

part 'category_repository.g.dart';

@Injectable()
class CategoryRepository extends Disposable {
  final Dio _dio;

  CategoryRepository(this._dio);

  Future<List<CategoryModel>> getCategories() async {
    try {
      Response response = await _dio.get(ConfigurationWp.categoriesUrl +
          "?consumer_key=${ConfigurationWp.key}&consumer_secret=${ConfigurationWp.secret}");
      return (response.data as List)
          .map(
            (e) => CategoryModel.fromJson(e),
          )
          .toList();
    } on DioError catch (e) {
      print(e.response);
      throw Exception(e.error.toString());
    }
    // return data;
  }

  @override
  void dispose() {}
}
