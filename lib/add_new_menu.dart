import 'package:flutter/material.dart';
import 'package:love_menu/DBProvider.dart';
import 'package:love_menu/home.dart';

import 'dart:ui';
import 'package:love_menu/menu.dart';



class AddNewMenu extends StatefulWidget {
  final bool edit;
  final Menu menu;

  AddNewMenu(this.edit,{this.menu}):assert(edit == true || menu == null);


  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<AddNewMenu> {
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField
  var userId = 0;
  var savedMenuName = "";
  var savedIngredient = "";
  var savedStep = "";
  var allSaved = "";

  final nameController = TextEditingController();
  final ingredientController = TextEditingController();
  final stepController = TextEditingController();

  //Future<List<Menu>> menus;

  final _formKey = new GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    //dbHelper = DBHelper();
    if (widget.edit == true) {
      nameController.text = widget.menu.name;
      ingredientController.text = widget.menu.ingredient;
      stepController.text = widget.menu.step;
    }
  }

  /*
  validate(){
    if(isUpdating){
      Menu menu = Menu(userId, savedMenuName, savedIngredients, savedSteps);
      dbHelper.update(menu);
      setState(() {
        isUpdating = false;
      });
    }
    else{
      Menu menu = Menu(null, savedMenuName, savedIngredients, savedSteps);
      dbHelper.update(menu)
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text('Add new menu'),
            backgroundColor: Colors.green[400]
        ),
        body: Form(

          key: _formKey,
          child:SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    textFormField(nameController, "Name", "Enter Name",
                        Icons.note, widget.edit ? widget.menu.name : "name"),
                    textFormFieldIngredient(
                        ingredientController, "Ingredients", "Enter ingredients",
                        widget.edit ? widget.menu.ingredient : "ingredient"),
                    textFormFieldStep(stepController, "Steps", "Enter steps",
                      widget.edit ? widget.menu.step : "step",),


                    RaisedButton(
                      color: Colors.green[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Save',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white
                        ),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data'))
                          );
                        } else if (widget.edit == true) {
                          DBProvider.dbProvider.update(new Menu(
                              name: nameController.text,
                              ingredient: ingredientController.text,
                              step: stepController.text,
                              id: widget.menu.id));
                          Navigator.pop(context);
                        } else {
                          await DBProvider.dbProvider.insert(new Menu(
                            name: nameController.text,
                            ingredient: ingredientController.text,
                            step: stepController.text,
                          ));
                          Navigator.pop(context);
                        }
                      },
                    )

                    /*Text(
                '用料',
                style: TextStyle(fontSize: 20,color: Colors.greenAccent),


              ),
              TextField(
                controller: ingredientController,
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
                controller: stepController,
                decoration: InputDecoration(
                    hintText:'production steps',
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(16))
                ),
                maxLength: 1000,
                maxLines: 10,
                textAlign: TextAlign.left,
              ),


              RaisedButton(
                color: Colors.green[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('Save',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white
                  ),
                ),
                onPressed: () async {
                  if (!_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data'))
                    );
                  }else if (widget.edit == true) {
                    DBProvider.dbProvider.update(new Menu(
                        name: nameController.text,
                        ingredient: ingredientController.text,
                        step: stepController.text,
                        id: widget.menu.id ));
                    Navigator.pop(context);
                  } else {
                    await DBProvider.dbProvider.insert(new Menu(
                      name: nameController.text,
                      ingredient: ingredientController.text,
                      step: stepController.text,
                    ));
                    Navigator.pop(context);
                  }
                },
              )*/
                  ],
                )
            ),

          )


        )
      /*ListView(
        //padding: const EdgeInsets.all(20),
          children:<Widget>[*/


      /*FlatButton(

              onPressed: (){

                setState(() {
                  savedMenuName = nameController.text;
                  savedIngredient = ingredientController.text;
                  savedStep = stepController.text;

                });

                var mew = Menu;
                var newDBMenu = Menu(id:userId,name:savedMenuName,ingredient:savedIngredient,step:savedStep);
                var newMenu = DBProvider.dbProvider.newMenu(newDBMenu);
                print("sui new db menu + $newDBMenu");
                print("sui new menu : $newMenu" );

                Navigator.pop(context, true);
              },
              color: Colors.green[400],
              padding: EdgeInsets.all(10.0),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.save),
                  Text("Save")

                ],
              ),
            ),*/
    );
  }


  textFormField(TextEditingController t, String label, String hint,
      IconData iconData, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
        controller: t,
        //keyboardType: TextInputType.number,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            prefixIcon: Icon(iconData),
            hintText: label,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      ),
    );
  }

  textFormFieldIngredient(TextEditingController t, String label, String hint,
       String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
        maxLines: 5,
        controller: t,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: label,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))

        ),
      ),
    );
  }

  textFormFieldStep(TextEditingController t, String label, String hint,
      String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
        maxLines: 7,
        controller: t,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: label,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      ),
    );
  }
}
