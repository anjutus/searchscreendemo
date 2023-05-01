import 'package:flutter/material.dart';
import 'package:searchscreen/bloc/pizza_event.dart';
import 'package:searchscreen/bloc/search/search_bloc.dart';
import 'package:searchscreen/bloc/search/search_event.dart';
import 'package:searchscreen/data/repositories/search_repository.dart';
import 'package:searchscreen/ui/ArticleListScreen.dart';
import 'package:searchscreen/bloc/pizza_bloc.dart';
import 'package:searchscreen/data/repositories/pizza_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchscreen/ui/search_view.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return

        RepositoryProvider(
          create: (context) =>PizzaRepositoryImpl() ,
          child: MultiBlocProvider(
              providers: [
                BlocProvider<PizzaBloc>(
                  create: (context) => PizzaBloc(PizzaRepositoryImpl()
                  )..add(FetchPizzaEvent()),lazy: false,),
                BlocProvider<SearchBloc>(
                  create: (context) => SearchBloc(SearchRepositoryImpl()
                  ))
              ],
              child: MaterialApp(
                title: 'Foodie App',
                home: SearchView(),
              )),
        );

  }
}
