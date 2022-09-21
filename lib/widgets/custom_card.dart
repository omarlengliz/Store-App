import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storeapp/Screens/update_product.dart';
import 'package:storeapp/models/produuct_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel ; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProduct.id  ,arguments: productModel);
      },
      child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration:  BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                      blurRadius: 40,
                      color: Colors.grey.withOpacity(.2)
                      ,
                      spreadRadius: 0,
                      offset: const Offset(10,10) 
                    )
                    ]
                  ),
                    height: 200,
                   width: 220,
                  child: Card(
                    
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text("${productModel.title?.substring(0,6)}",style:const TextStyle(color: Colors.grey,fontSize: 16) ,),
                          const SizedBox(height: 
                          15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                
                               Text(' \$ ${productModel.price ?? 0.0 }'),
                              const Icon(Icons.favorite)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
               Positioned(
                top:5,
                right: 32,
                child:  Image.network(productModel.image ?? "" ,height:100 , width: 100,))
              ],
            ),
    );
  }
}