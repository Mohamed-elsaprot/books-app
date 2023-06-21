import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>> fetchSearchResult(String key);

}