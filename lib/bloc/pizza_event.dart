import 'package:equatable/equatable.dart';
abstract class PizzaEvent extends Equatable{
 const PizzaEvent();
}
class FetchPizzaEvent extends PizzaEvent{


  @override
  List<Object> get props => [];
}