import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Custom_Button extends StatelessWidget {
  

  const Custom_Button({Key? key, required this.text, required this.onTap, }) : super(key: key);
  final  String text;
    final  VoidCallback  onTap;


  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
child: Container (
decoration: BoxDecoration (
color: Colors.blue,
borderRadius: BorderRadius .circular (8) ,),
width: double. infinity,
height: 60,
child: Center (
child: Text(text, style: TextStyle(color: Colors.white),)
), 
));
        
  }
}
