
import 'dart:convert';

//Menu menuFromJson(String str) =>Menu.fromMap(json.decode(str));
//String menuToJson(Menu data) => json.encode(data.toMap());

class Menu {
  int id;
  String name;
  String ingredient;
  String step;

  Menu({
    this.id,
    this.name,
    this.ingredient,
    this.step
  });


   factory Menu.fromMap(Map<String,dynamic> json) => new Menu(
     id : json["id"],
     name :json ["name"],
     ingredient :json["ingredient"],
     step :json["step"]
   );


  Map<String,dynamic> toMap()=>{
    "id": id,
    "name": name,
    "ingredient": ingredient,
    "step": step,
  };
}