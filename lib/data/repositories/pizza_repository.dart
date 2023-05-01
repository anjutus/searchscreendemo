import 'package:searchscreen/data/model/pizza.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
abstract class PizzaRepository{
Future<List<Recipe>> getPizza();
}

class PizzaRepositoryImpl implements PizzaRepository{
  @override
  Future<List<Recipe>> getPizza() async{
    var response= await http.get( Uri.parse('https://forkify-api.herokuapp.com/api/search?q=pizza#' ));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Recipe> recipes = Pizza.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}