import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:searchscreen/data/model/pizza.dart';

class PizzaDetail extends StatelessWidget {
  final Recipe recipes;
  PizzaDetail({required this.recipes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipes.title),
      ),
      body: Center( child:Column(
        children: [
          SizedBox(height: 8,),
          Image.network(recipes.imageUrl),
          Text(recipes.title,style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(recipes.publisher),
          Text(recipes.sourceUrl),

        ],
      ),)
    );
  }
}