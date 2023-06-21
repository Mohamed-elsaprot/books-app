
import 'package:bookly/features/home/data/models/BookModel.dart';

abstract class FeaturedBooksState{
  const FeaturedBooksState();
}

class FeaturedBooksInitial extends FeaturedBooksState{}
class FeaturedBooksLoading extends FeaturedBooksState{}
class FeaturedBooksSuccess extends FeaturedBooksState{
  final List<BookModel> books;
  const FeaturedBooksSuccess(this.books);
}
class FeaturedBooksFailure extends FeaturedBooksState{
  final String errorMessage;
  const FeaturedBooksFailure(this.errorMessage);

}
