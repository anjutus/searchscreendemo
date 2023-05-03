
import 'package:equatable/equatable.dart';
import 'package:searchscreen/data/model/pizza.dart';
abstract  class SearchState extends  Equatable{

}
class SearchUninitialized extends SearchState{
  @override
  List<Object?> get props =>[];
}
class SearchLoadingState extends SearchState{

  @override
  List<Object?> get props => [];

}
class SearchLoaded extends SearchState{
  final List<Recipe> recipes;
  SearchLoaded({required this.recipes});
  @override
  List<Object?> get props => [];

}

class SearchErrorState extends SearchState{
  final String message;
  SearchErrorState({required this.message});
  @override
  List<Object?> get props => [];

}