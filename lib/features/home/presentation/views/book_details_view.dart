import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_details_view_widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BooksDetailsView extends StatefulWidget{
  const BooksDetailsView({Key? key,  required this.book}) : super(key: key);

  final BookModel book;
  @override
  State<StatefulWidget> createState() {
    return BookDetailsViewState(book);
  }
}

class BookDetailsViewState extends State {
  final BookModel book;
  BookDetailsViewState(this.book);
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: book.volumeInfo.categories?[0]?? 'Science');
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBody(bookModel: book,),
    );
  }
}
