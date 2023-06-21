import 'package:bookly/features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit( this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  String s='science';
  Future<void> fetchSearchResult()async{
    emit(SearchLoading());

   var result = await searchRepo.fetchSearchResult(s);

    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}