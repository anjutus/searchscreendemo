import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchscreen/bloc/pizza_event.dart';
import 'package:searchscreen/bloc/pizza_state.dart';
import 'package:searchscreen/data/model/pizza.dart';
import 'package:searchscreen/data/repositories/pizza_repository.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

class PizzaBloc extends Bloc<PizzaEvent,PizzaState> {
  final PizzaRepository repository;

  PizzaBloc(this.repository) : super(PizzaInitialState()){
    on<FetchPizzaEvent>(
            (event,emit) async {
      try {
        emit( PizzaLoadingState());
        List<Recipe> recipes = await repository.getPizza();
        emit(PizzaLoadedState(recipes: recipes));
      } catch (e) {
        emit(PizzaErrorState(message: e.toString()));
      }

    });
  }

  //PizzaState get initialState => PizzaInitialState();

  //Stream<PizzaState> mapEventToState(PizzaState event)
  // Future<void> _onFetchPizzaEvent(
  //     FetchPizzaEvent event,
  //     Emitter<PizzaState> emit,
  //     )async {
  //
  //     try {
  //       if(isClosed) return;
  //       emit( PizzaLoadingState());
  //       List<Recipe> recipes = await repository.getPizza();
  //       emit(PizzaLoadedState(recipes: recipes));
  //     } catch (e) {
  //       emit(PizzaErrorState(message: e.toString()));
  //     }
  //
  // }
}