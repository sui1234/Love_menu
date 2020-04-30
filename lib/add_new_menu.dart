import 'package:flutter/material.dart';
import 'dart:ui';
import 'menu.dart';
import 'dart:async';

class AddNewMenu extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: new Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<Menu> {
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField
  String savedMenuName = "";
  String savedIngredients = "";
  String savedSteps = "";
  String allSaved = "";

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title:Text('Add new menu'),
          backgroundColor: Colors.green[400]
      ),
      body: ListView(
        //padding: const EdgeInsets.all(20),
          children:<Widget>[

            TextField(
              controller: myController1,
              decoration: InputDecoration(
                  hintText: 'New Menu Name',
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(16))
              ),
            ),


            Text(
              '用料',
              style: TextStyle(fontSize: 20,color: Colors.greenAccent),


            ),
            TextField(
              controller: myController2,
              decoration: InputDecoration(
                  hintText: 'Enter your ingredients',
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(16))
              ),
              maxLength: 1000,
              maxLines: 10,
              textAlign: TextAlign.left,

            ),

            Text(
              '制作步骤',
              style: TextStyle(fontSize: 20,color: Colors.greenAccent),

            ),
            TextField(
              controller: myController3,
              decoration: InputDecoration(
                  hintText:'production steps',
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(16))
              ),
              maxLength: 1000,
              maxLines: 10,
              textAlign: TextAlign.left,
            ),

            FlatButton(

              onPressed: () {
                setState(() {
                  allSaved = myController1.text + "  " + myController2.text + "  " + myController3.text;
                  print("sui "+ allSaved);
                });
              },
              color: Colors.green[400],
              padding: EdgeInsets.all(10.0),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.save),
                  Text("Save")
                ],
              ),
            ),

          ]
      ),
    );
  }
}

