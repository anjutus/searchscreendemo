import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchscreen/bloc/search/search_bloc.dart';
import 'package:searchscreen/bloc/search/search_event.dart';
import 'package:searchscreen/bloc/search/search_state.dart';
import 'package:searchscreen/ui/loading.dart';
import 'package:searchscreen/ui/list.dart';
import 'package:searchscreen/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState   extends State<SearchView> {


  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(
          () => context
          .read<SearchBloc>()
          .add(Search(query: _controller.text))
    );

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
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text("Failed to Load")),
            );

        }


      },
      builder: (context, state) {
        return Scaffold(appBar: AppBar(
            title: const Text(
                'Recipes'
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
              buildHintsList(state.recipes)
          ],
        ));

      },
    );
  }

}