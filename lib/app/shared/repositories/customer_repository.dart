import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/shared/configuration/configuration_wp.dart';
import 'package:minha_loja/app/shared/models/customer_model.dart';
import 'package:minha_loja/app/shared/models/login_model.dart';

part 'customer_repository.g.dart';

@Injectable()
class CustomerRepository extends Disposable {
  final Dio _dio;

  CustomerRepository(this._dio);

  Future<bool> createCustomer(CustomerModel model) async {
    var authToken = base64.encode(
      utf8.encode(ConfigurationWp.key + ":" + ConfigurationWp.secret),
    );
    bool ret = false;

    try {
      var response = await _dio.post(ConfigurationWp.url + ConfigurationWp.customerUrl,
          data: model.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<Response> loginCustomer(String username, String password) async {
    LoginModel model;
    try {
      var response = await _dio.post(
        ConfigurationWp.tokenUrl,
        data: {
          "username": username,
          "password": password,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
          },
        ),
      );
      if (response.statusCode == 200 && response.data[0] == true) {
        print(response.data[0]);
        model = LoginModel.fromJson(response.data);
      } else {
        return response;
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.error.toString());
    }
  }

  @override
  void dispose() {}
}
