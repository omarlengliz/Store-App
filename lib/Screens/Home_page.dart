import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/produuct_model.dart';
import 'package:storeapp/services/get_all_products_service.dart';
import 'package:storeapp/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Tren",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: ((context, snapshot) {
            if(snapshot.hasData)
            {
              List<ProductModel> data=snapshot.data! ; 
              
              return GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return  CustomCard(productModel: data[index],);
                }));
            }
            else
            {
              return Center(child:  CircularProgressIndicator(),);
            }
          }),
        ));
  }
}
