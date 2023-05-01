import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchscreen/bloc/pizza_bloc.dart';
import 'package:searchscreen/bloc/pizza_event.dart';
import 'package:searchscreen/bloc/pizza_state.dart';
import 'package:searchscreen/bloc/search/search_bloc.dart';
import 'package:searchscreen/bloc/search/search_event.dart';
import 'package:searchscreen/bloc/search/search_state.dart';
import 'package:searchscreen/data/model/pizza.dart';
import 'package:searchscreen/ui/loading.dart';
import 'package:searchscreen/ui/list.dart';
import 'package:searchscreen/ui/error.dart';
import 'package:searchscreen/ui/pizza_detail.dart';
import 'package:searchscreen/widgets/search_headline_text.dart';
import 'package:searchscreen/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState   extends State<SearchView> {

  late PizzaBloc pizzaBloc;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(
          () => context
          .read<SearchBloc>()
          .add(Search(query: _controller.text)),
    );
    //pizzaBloc = BlocProvider.of<PizzaBloc>(context);
    // pizzaBloc.add(FetchPizzaEvent());

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchErrorState) {
          String errorMsg=state.message;
          if(errorMsg == 'Loading'){
            buildLoading();
          }
          else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Failed to Load')),
              );
          }
        }
      },
      builder: (context, state) {
    if (state is SearchLoaded) {
      if (state.recipes.isEmpty) {
        return const Center(
          child: Text('No Results'),
        );
      }
    }
        return Scaffold(appBar: AppBar(
            title: const Text(
                'Articles'
            )
        ),body:ListView(
          shrinkWrap: true,
          children: [
            Card (child: SearchTextField(
              key: const Key('searchPage_searchTextField'),
              controller: _controller,
            ),),
            const Divider(),
            if(state is SearchLoaded)
              buildHintsList(state.recipes),
          ],
        ));
      },
    );
  }

}