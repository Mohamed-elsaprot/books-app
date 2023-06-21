import 'package:bookly/features/home/presentation/manager/news_books_cubit/news_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';

class NewsBooksCubit extends Cubit<NewsBooksState>{
  NewsBooksCubit( this.homeRepo) : super(NewsBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsBooks()async{
    emit(NewsBooksLoading());

    var result = await homeRepo.fetchNewsedBooks();
    result.fold((failure) {
      emit(NewsBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewsBooksSuccess(books));
    });
  }
}