import 'package:flutter/material.dart';
import 'add_new_menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView.builder(
          itemCount: 6,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:1.0,horizontal:4.0),
              child: Card(
                child: ListTile(
                  onTap: () {

                  },
                  title:Text(
                      ''
                  ),
                  leading:CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    //backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add button is clicked');
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return AddNewMenu();
          }));

          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );

  }
}
