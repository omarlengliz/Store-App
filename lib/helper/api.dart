import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:storeapp/models/produuct_model.dart';

class Api {
  final Dio _dio = new Dio();

 Future<Response> get({required String token, required String url}) async {
    Response response ;
    try {
      _dio.options.contentType = "application/json;charset=UTF-8";

      _dio.options.headers["Authorization"] = "Bearer $token";

      response = await _dio.get(url);

      return response;
    } on DioError catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
  Future<dynamic> post({ required String url,@required dynamic body , @required String? token  }) async
  {
    Map<String , String > headers ={};
    if(token != null )
    {
      headers.addAll({"Authorization" : "Bearer $token"});
    }
    var response =  await _dio.post(url, data : body  , options: Options(headers: headers),  ); 
   if(response.statusCode ==200)
   {
     Map<String,dynamic> data = jsonDecode(response.data);
    return data; 
   }
   else 
   {
    throw Exception("there is an error ");
   }
  }
  Future<dynamic> put({ required String url,@required dynamic body , @required String? token  }) async
  {
    Map<String , String > headers ={};
    if(token != null )
    {
      headers.addAll({"Authorization" : "Bearer $token"});
    }
    var response =  await _dio.put(url, data : body  , options: Options(headers: headers),  ); 
   if(response.statusCode ==200)
   {
    ProductModel data = ProductModel.fromJson(response.data);
    print(data.toJson());
    return data; 
   }
   else 
   {
    throw Exception("there is an error ");
   }
  }
}