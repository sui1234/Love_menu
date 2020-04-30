import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          //isSearching is false => text(home), otherwise => show textField(search here)
          title:Text('Ingredients'),
          backgroundColor: Colors.green[200],
        ),
    );
  }
}