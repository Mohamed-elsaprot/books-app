import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>> fetchNewsedBooks();
  Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>fetchSimilarBooks({required String category});
}