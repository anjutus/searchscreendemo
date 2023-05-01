
import 'package:equatable/equatable.dart';
import 'package:searchscreen/data/model/pizza.dart';
abstract  class PizzaState extends  Equatable{

}
class PizzaInitialState extends PizzaState{
  @override
  List<Object?> get props =>[];
}
class PizzaLoadingState extends PizzaState{

  @override
  List<Object?> get props => [];

}
class PizzaLoadedState extends PizzaState{
  final List<Recipe> recipes;
  PizzaLoadedState({required this.recipes});
  @override
  List<Object?> get props => [];

}
class PizzaErrorState extends PizzaState{
  final String message;
  PizzaErrorState({required this.message});
  @override
  List<Object?> get props => [];

}