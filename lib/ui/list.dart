import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:searchscreen/data/model/pizza.dart';
import 'package:searchscreen/ui/pizza_detail.dart';

Widget buildHintsList(List<Recipe> recipes) {
  String imageURL;
  String title ;
  return SafeArea(child:ListView.builder(
        itemCount: recipes.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(7.0),
        itemBuilder: (context, index) {
          imageURL=recipes[index].imageUrl;
          title=recipes[index].title;
          //recipeCard(imageURL,title,context);
          return Card(
            color: Colors.yellow[50],
            elevation: 8.0,
            margin: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell (
          onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) =>
          PizzaDetail(recipes: recipes[index])));
          },child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Image.network(
                  imageURL,
                  height: 80,
                  width: 80,

                ),
              ),
              Flexible(child: Text(
                title,
              ),)
            ],
          ),)

          );
        }),
  );
}


Widget recipeCard(String image, String title, BuildContext context) {
  return Card(
    color: Colors.yellow[50],
    elevation: 8.0,
    margin: EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Image.network(
            image,
            height: 50,
            width: 50,
            
          ),
        ),
        Text(
          title,
        ),
      ],
    ),
  );
}
