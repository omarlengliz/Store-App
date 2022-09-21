import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/produuct_model.dart';

class AddProduct 
{
  Future<ProductModel> addProduct({
    String? title, String? price, String? desc, String? image, String? category})
    async {
    Map<String,dynamic> data=  await Api().post(url: "https://fakestoreapi.com/products", body: 
      {
        "title" : title , 
        "price" : price , 
        "description" : desc , 
        "image" : image ,
        "category" : category 
      },token: null) ;
      return ProductModel.fromJson(data);
    }
}