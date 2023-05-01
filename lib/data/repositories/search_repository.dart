import 'package:searchscreen/data/model/pizza.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
abstract class SearchRepository{
  Future<List<Recipe>> searchPizza(String query);
}

class SearchRepositoryImpl implements SearchRepository{
  @override
  Future<List<Recipe>> searchPizza(query) async{
    try{
      var response= await http.get( Uri.parse('https://forkify-api.herokuapp.com/api/search?q=$query' ));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<Recipe> recipes = Pizza
            .fromJson(data)
            .recipes;
        return recipes;
      } else {throw ("Loading");}
    }
    catch(error){
      throw ("Failed");

    }
  }
}