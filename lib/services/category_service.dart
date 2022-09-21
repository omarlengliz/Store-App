import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/produuct_model.dart';

class CategoryService {
  Dio? _dio;

  Future<List<ProductModel>> getCategoryProduct(
      {required String category_name}) async {
    Response ?  response = await Api()
        .get(url : "https://fakestoreapi.com/products/categories/$category_name", token: '');

      List<dynamic> data = jsonDecode(response.data);
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return productsList;

    }
  }

