import 'dart:convert';

import 'package:dio/dio.dart';

import '../helper/api.dart';

class AllCategoryService {
  Future<Future> getAllCategory() async {
    Response? _response = await Api().get(url: "https://fakestoreapi.com/products/categories", token: '');
      Future<dynamic> data = jsonDecode(_response.data);
    return data;
    
  
  }
}
