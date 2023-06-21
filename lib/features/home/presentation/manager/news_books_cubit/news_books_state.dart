 import 'package:bookly/features/home/data/models/BookModel.dart';

abstract class NewsBooksState{
  const NewsBooksState();
}

class NewsBooksInitial extends NewsBooksState{}
class NewsBooksLoading extends NewsBooksState{}
class NewsBooksSuccess extends NewsBooksState{
  final List<BookModel> books;
  const NewsBooksSuccess(this.books);
}
class NewsBooksFailure extends NewsBooksState{
  final String errorMessage;
  const NewsBooksFailure(this.errorMessage);

}
