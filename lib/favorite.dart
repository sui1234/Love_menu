import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        //isSearching is false => text(home), otherwise => show textField(search here)
        title:Text('Favorite'),
        backgroundColor: Colors.green[200],

      ),
    );
  }
}