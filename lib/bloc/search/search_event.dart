import 'package:equatable/equatable.dart';
abstract class SearchEvent extends Equatable{
  const SearchEvent();
}
class Search extends SearchEvent{
  late String query;
  Search({required this.query});

  @override
  List<Object> get props => [];
}