import 'package:flutter/material.dart';
import 'dart:ui';

class AddNewMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text('Add new menu'),
      ),
      body: ListView(
        //padding: const EdgeInsets.all(20),
        children:<Widget>[

          TextField(
            decoration: InputDecoration(
                hintText: 'New Menu Name',
                border:OutlineInputBorder(borderRadius:BorderRadius.circular(16))
            ),
          ),

          Text('yongliao',textDirection:TextDirection.ltr),

        ]

      )

    );





  }
}