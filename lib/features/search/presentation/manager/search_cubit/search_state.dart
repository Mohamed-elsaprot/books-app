 import 'package:bookly/features/home/data/models/BookModel.dart';

abstract class SearchState{
  const SearchState();
}

class SearchInitial extends SearchState{}
class SearchLoading extends SearchState{}
class SearchSuccess extends SearchState{
  final List<BookModel> books;
  const SearchSuccess(this.books);
}
class SearchFailure extends SearchState{
  final String errorMessage;
  const SearchFailure(this.errorMessage);

}
