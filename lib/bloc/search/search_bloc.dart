import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchscreen/bloc/search/search_event.dart';
import 'package:searchscreen/bloc/search/search_state.dart';
import 'package:searchscreen/data/model/pizza.dart';
import 'package:searchscreen/data/repositories/search_repository.dart';
class SearchBloc extends Bloc<SearchEvent,SearchState> {
  final SearchRepository repository;

  SearchBloc(this.repository) : super(SearchUninitialized()) {
    on<Search>(
            (event, emit) async {
          try {
            emit(SearchUninitialized());
            List<Recipe> recipes = await repository.searchPizza(event.query);
            emit(SearchLoaded(recipes: recipes));
          } catch (e) {
            emit(SearchErrorState(message: e.toString()));
          }
        });
  }
}