import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsedBooks() async {
    try {
      var data = await apiService.get(endPointUrl:
      'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<BookModel> books=[];
      for (var i in data['items']){
        try{
          books.add(BookModel.fromJson(i));
        }catch(e){
          books.add(BookModel.fromJson(i));
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try {
      Map<String, dynamic> data = await apiService.get(endPointUrl:
      'volumes?Filtering=free-ebooks&q=subject:planets');
      List<BookModel> books=[];
      for (var i in data['items']){
       try{
         books.add(BookModel.fromJson(i));
       }catch(e){
         books.add(BookModel.fromJson(i));
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await apiService.get(endPointUrl:
      'volumes?Filtering=free-ebooks&Sorting=relevance &q=intitle:$category');
      List<BookModel> books=[];
      for (var i in data['items']){
        try{
          books.add(BookModel.fromJson(i));
        }catch(e){
          books.add(BookModel.fromJson(i));
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
