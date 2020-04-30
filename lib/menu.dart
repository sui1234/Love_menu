class Menu {
  int id;
  String name;
  String ingredients;
  String steps;

  Menu(this.name,this.ingredients,this.steps);

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      'id':id,
      'name':name,
      'ingredients':ingredients,
      'steps':steps
    };
    return map;
  }


  Menu.fromMap(Map<String,dynamic>map){
    id = map['id'];
    name = map['name'];
    ingredients = map['ingredients'];
    steps = map['steps'];
  }

}