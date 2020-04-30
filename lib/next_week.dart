import 'package:flutter/material.dart';

class NextWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        //isSearching is false => text(home), otherwise => show textField(search here)
        title:Text('Next_week'),
        backgroundColor: Colors.green[200],

      ),
    );
  }
}