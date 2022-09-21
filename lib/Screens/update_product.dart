
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/services/update_product_service.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_input.dart';

import '../models/produuct_model.dart';

class UpdateProduct extends StatefulWidget {
   UpdateProduct({Key? key}) : super(key: key);
  static String id = "update product";

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
   String? _name ; 

   String?  _description ; 

   int?  _price ; 

   String? _image ; 

  bool isLoading= false;

  @override
  Widget build(BuildContext context) {
  ProductModel productModel=ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD (
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: MyWidget(
                      textController: (data)
                      {
                        print(data);
                        _name=data;
                      },
                      title: "Product Name",
                      isPassword: false,
                      lines: 1,
                      isNumber: false, length: 25,
                      )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: MyWidget(
                      textController: (data)
                      {
                        print(data);
                        _description=data;
                      },
                      title: "Description",
                      isPassword: false,
                      lines: 1,
                      isNumber: false, length: 25,
                      )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: MyWidget(
                      textController: (data)
                      {
                        print(data);
                        _price=int.parse(data);
                      },
                      title: "Price",
                      isPassword: false,
                      lines: 1,
                      isNumber: true, length: 25,
                      )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: MyWidget(
                      textController: (data)
                      {
                        print(data);
                        _image=data;
                      },
                      title: "Image",
                      isPassword: false,
                      lines: 1,
                      isNumber: false, length: 25,
                      )),
              
              Padding(
                  padding: EdgeInsets.all(10),
                  child:Custom_Button(text: "Update", onTap: () async {
                    isLoading=true;
                    setState(() {
                      
                    });
                     try
                      {
                      await   update(productModel);
                      print(productModel.title);
                      }catch(e)
                      {
                        print(e.toString());
                      }
                       isLoading=false ;
                    setState(() {
                      
                    });
                  },)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> update(ProductModel productModel) async {
   await   UpdateProductService().updateProduct(
      id: productModel.id!,
      title: _name ?? productModel.title ,desc :  _description ?? productModel.description,price: _price ?? productModel.price  , image: _image ?? productModel.image,category: productModel.category
    );
  }
}
