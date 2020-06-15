import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'add_new_menu.dart';
import 'package:love_menu/DBProvider.dart';
import 'package:love_menu/menu.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isSearching = false;
  List<String> newMenu;
  Future _menuFuture;

  //var db = new  DBProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _menuFuture = getMenu();
    print("menuFuture is $_menuFuture");
  }

//get menu information from database
  getMenu() async{
    final _menuData = await DBProvider.dbProvider.getAllMenus();
    print(" sui menuData $_menuData");
    return _menuData;
  }

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

      body:
      FutureBuilder<List<Menu>>(
        //we call the method, which is in the folder db file database.dart
        future: DBProvider.dbProvider.getAllMenus(),
        builder: (BuildContext context, AsyncSnapshot<List<Menu>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              //Count all menus
              itemCount: snapshot.data.length,
              //all the records that are in the Menu table are passed to an item Menu item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index){
                Menu item = snapshot.data[index];
                //delete one register for id
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red[200],
                    child: Padding(
                      padding:EdgeInsets.all(1),
                      child: Icon(Icons.delete,
                      color: Colors.white,
                      ),

                    ),
                  ),
                  onDismissed: (diretion) {
                    DBProvider.dbProvider.delete(item.id);
                  },
                  //Now we paint the list with all the records, which will have a number, name, ingredient
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.ingredient),
                    leading: CircleAvatar(child: Text(item.id.toString(),style: TextStyle(color: Colors.green[600]),),backgroundColor: Colors.green[300],),
                    //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                    //This method is in the file add_new_menu.dart
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddNewMenu(
                            true,
                            //Here is the menu that we want to edit
                            menu: item,
                          )
                      )
                      );
                    },
                  ),
                );
              },
            );
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),


//add floatingbutton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add button is clicked');
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return AddNewMenu(false);
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
