import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:storeapp/models/produuct_model.dart';

import '../helper/api.dart';
class AllProductsService
{
  Dio? _dio ; 
  Future <List<ProductModel>> getAllProducts() async
  {
      Response? response =  await Api().get( token: "token", url:  "https://fakestoreapi.com/products");
         List<dynamic> data = response.data;
         print(response);
      List<ProductModel> productsList=[];
      for (int i=0 ; i<data.length ; i++ )
      {
        productsList.add(
          ProductModel.fromJson(data[i]),

        );

      }
    return productsList ; 
    
  }

}