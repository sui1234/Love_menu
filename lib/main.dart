import 'package:flutter/material.dart';
import 'package:love_menu/home.dart';

import 'Ingredients.dart';
import 'favorite.dart';
import 'next_week.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}
class MyAppState extends State<MyApp> {

  int _selectedPage = 0;

  bool isSearching = false;

  final _pageOptions = [
    Home(),
    NextWeek(),
    Favorite(),
    Ingredients()

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helper',
      theme: ThemeData.light(),
      home: Scaffold(

        body: _pageOptions[_selectedPage],

        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPage,

            //iconSize: 30,
            type: BottomNavigationBarType.fixed,
            onTap: (int index){
              setState(() {
                _selectedPage = index;
              });
            },
            items:[
              BottomNavigationBarItem(
                  icon:Icon(
                      Icons.home,
                      color:Colors.green[200],
                  ),
                  title:Text(
                      'Home',
                      style:TextStyle(color:Colors.green[200])
                  ),
                  //backgroundColor: Colors.redAccent
              ),
              BottomNavigationBarItem(
                  icon:Icon(
                      Icons.book,
                      color:Colors.green[200]
                  ),
                  title:Text(
                      'NextWeek',
                      style:TextStyle(color:Colors.green[200])
                  ),
                  //backgroundColor: Colors.redAccent
              ),
              BottomNavigationBarItem(
                  icon:Icon(
                      Icons.favorite,
                      color:Colors.green[200],
                  ),
                  title:Text(
                    'Favorite',
                      style:TextStyle(color:Colors.green[200])
                  ),

                 // backgroundColor: Colors.redAccent
              ),
              BottomNavigationBarItem(
                  icon:Icon(
                      Icons.label,
                      color:Colors.green[200],
                  ),
                  title:Text(
                      'Ingredients',
                      style:TextStyle(color:Colors.green[200])
                  ),

                  //backgroundColor: Colors.redAccent
              )
            ]
        ),
      ),

    );
  }
}
