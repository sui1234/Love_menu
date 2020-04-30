import 'package:flutter/material.dart';
import 'add_new_menu.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar:AppBar(
        //isSearching is false => text(home), otherwise => show textField(search here)
        title:!isSearching
            ? Text('Home')
            :TextField(

          style: TextStyle(color:Colors.white),
          decoration: InputDecoration(
              icon: Icon(Icons.search,color: Colors.white,),
              hintText:"Search here",
              hintStyle: TextStyle(color: Colors.white)
          ),
        ),
        actions: <Widget>[
          //if isSearching is true,I want to have a cancel button
          isSearching ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                this.isSearching = false;
              });
            },
          ):
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                this.isSearching = true;
                searchMenu();
              });
            },
          )
        ],
        backgroundColor: Colors.green[200],

      ),
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
                      'aaaa'
                  ),
                  leading:CircleAvatar(
                    backgroundColor: Colors.green[200],
                    //backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ),


//add floatingbutton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add button is clicked');
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return AddNewMenu();
          }));

          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[400],
      ),
    );

  }
  void searchMenu(){
    this.isSearching = true;
  }
}
