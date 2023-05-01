import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchscreen/bloc/pizza_bloc.dart';
import 'package:searchscreen/bloc/pizza_event.dart';
import 'package:searchscreen/bloc/pizza_state.dart';
import 'package:searchscreen/bloc/search/search_bloc.dart';
import 'package:searchscreen/bloc/search/search_event.dart';
import 'package:searchscreen/bloc/search/search_state.dart';
import 'package:searchscreen/ui/loading.dart';
import 'package:searchscreen/ui/list.dart';
import 'package:searchscreen/ui/error.dart';
import 'package:searchscreen/ui/pizza_detail.dart';

class ArticleListScreen extends StatefulWidget {
  @override
  ArticleListScreenState createState() => ArticleListScreenState();
}

class ArticleListScreenState   extends State<ArticleListScreen> {

  late PizzaBloc pizzaBloc;

  @override
  void initState() {
    super.initState();
    pizzaBloc = BlocProvider.of<PizzaBloc>(context);
    // pizzaBloc.add(FetchPizzaEvent());

  }


  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Articles'
          )
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Search ...'),
              onTap: () {
    showSearch(
    context: context,
    delegate: SearchPizza(
    searchBloc: BlocProvider.of<SearchBloc>(context)));
    },

            ),
          ),
    Container(
    child: BlocBuilder<PizzaBloc, PizzaState>(builder: (context, state) {
    if (state is PizzaInitialState) {
    return buildLoading();
    } else if (state is PizzaLoadingState) {
    return buildLoading();
    } else if (state is PizzaLoadedState) {
    return buildHintsList(state.recipes);
    } else if (state is PizzaErrorState) {
    return buildError(state.message);
    } else
      return const Center(child: Text('No Results'));
    })
    ) ],
      ),
    );
  }

}

class SearchPizza extends SearchDelegate<List>{
  SearchBloc searchBloc;
  SearchPizza({required this.searchBloc});
  late String queryString;
  @override
  List<Widget> buildActions(BuildContext context){
    return[
      IconButton(onPressed: (){query='';},
                icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){},
          icon: const Icon(Icons.arrow_back))
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    String imageURL;
    String title;
    queryString = query;
    searchBloc.add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchUninitialized) {
        return CircularProgressIndicator();
      }
      if (state is SearchLoaded) {
        if (state.recipes.isEmpty) {
          return const Center(
            child: Text('No Results'),
          );
        }
        ListView.builder(
            itemCount: state.recipes.length,
            shrinkWrap: true,
            //padding: const EdgeInsets.all(7.0),
            itemBuilder: (context, index) {
              imageURL=state.recipes[index].imageUrl;
              title=state.recipes[index].title;
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
                                  PizzaDetail(recipes: state.recipes[index])));
                    },
                    child:Row(
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
                )),
              );
            });
      }
      if (state is SearchErrorState) {
        return buildError('Failed to Load');
      } else
        return const Center(child: Text('No Results'));
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
