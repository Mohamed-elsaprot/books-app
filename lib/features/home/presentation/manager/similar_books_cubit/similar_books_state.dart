
import 'package:bookly/features/home/data/models/BookModel.dart';

abstract class SimilarBooksState{
  const SimilarBooksState();
}

class SimilarBooksInitial extends SimilarBooksState{}
class SimilarBooksSuccess extends SimilarBooksState{
  final List<BookModel> books;
  const SimilarBooksSuccess(this.books);
}
class SimilarBooksFailure extends SimilarBooksState{
  final String errorMessage;

  const SimilarBooksFailure(this.errorMessage);
}
class SimilarBooksLoading extends SimilarBooksState{}