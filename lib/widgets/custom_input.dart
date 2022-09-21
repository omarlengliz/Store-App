import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  var textController;



   MyWidget({Key? key, required this.title, required this.isPassword, required this.lines, required this.isNumber, required this.textController, required this.length}) : super(key: key);
  final String title;
  final bool isPassword;
    final int lines;
      
    final bool isNumber;  
    final int length;
  @override
  Widget build(BuildContext context) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        
          TextFormField(
            onChanged:textController ,
            
            maxLength: length,
            inputFormatters: [
              LengthLimitingTextInputFormatter(length),
            ],
            
            obscureText: isPassword,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration:  InputDecoration(
                counterText: '',
                hintText: title,
                focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.0),
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),)
        ],
      ),
    );
}
