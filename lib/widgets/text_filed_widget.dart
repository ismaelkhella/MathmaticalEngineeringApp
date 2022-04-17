import 'package:flutter/material.dart';

class TextFiledWidget extends StatelessWidget {
    TextFiledWidget({
    Key? key,required this.controller,required this.textInputType,required this.lableText,required this.maxHeight,required this.maxWidth,required this.minHeight,required this.minWidth
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType textInputType;
  final String lableText;
  final Color color=Colors.grey;
 double maxHeight=0;
 double maxWidth=0;
 double minHeight=0;
 double minWidth=0;


   @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelText: lableText,
          filled: true,
          fillColor: color,
          constraints: BoxConstraints(
              maxHeight: maxHeight,
              maxWidth: maxWidth,
              minHeight: minHeight,
              minWidth: maxWidth,),
          floatingLabelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black),
    );
  }
}
