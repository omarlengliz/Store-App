import '../helper/api.dart';
import '../models/produuct_model.dart';

class UpdateProductService
{

  Future<ProductModel> updateProduct({
    required int id,
    String? title, int? price, String? desc, String? image, String? category})
    async {
    ProductModel data=  await Api().put(url: "https://fakestoreapi.com/products/$id", body: 
      {
        "title" : title , 
        "price" : price , 
        "description" : desc , 
        "image" : image ,
        "category" : category 
      },token: null) ;
      return  data;
    }
}