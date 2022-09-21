import 'package:flutter/material.dart';
import 'package:storeapp/Screens/Home_page.dart';
import 'package:storeapp/Screens/update_product.dart';

void main()
{
  runApp(const StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          HomePage.id : (context)=>const HomePage(),
          UpdateProduct.id  :(context) =>  UpdateProduct()
        },
        initialRoute: HomePage.id,
    );
    
  }
}