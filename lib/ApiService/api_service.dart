// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skill_harvest_app/ApiService/model/products.dart';

class ApiRoute {
  ///Product endpoint
  static const product = 'https://jsonplaceholder.typicode.com/posts';
}

class ApiService {
  static Future<List<Product>?> getProduct() async {
    http.Response result = await http.get(Uri.parse(ApiRoute.product));

    if (result.statusCode != 200) {
      return null;
    }

    List<dynamic> decodeJson = jsonDecode(result.body);

    List<Product> list =
        decodeJson.map((data) => Product.fromJson(data)).toList();

    return list;
  }
}
