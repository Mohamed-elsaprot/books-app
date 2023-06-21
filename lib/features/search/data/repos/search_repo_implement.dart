import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);


  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(String keyWord) async{
    try {
      var data = await apiService.get(endPointUrl:
      'volumes?Filtering=free-ebooks&q=$keyWord');
      List<BookModel> books=[];
      for (var i in data['items']){
       try{
         books.add(BookModel.fromJson(i));
       }catch(e){
         //books.add(BookModel.fromJson(i));
       }
      }
      return right(books);
    } catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString())) ;
    }
  }

}
