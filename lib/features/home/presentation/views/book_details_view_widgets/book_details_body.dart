
import 'package:bookly/features/home/data/models/BookModel.dart';

import 'book_details_bottom_body.dart';
import 'book_details_top_body.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          children:  [
            const SizedBox(height: 10,),
            BookDetailsTopBody(bookModel: bookModel,),
            const SizedBox(height: 20,),
            const BookDetailsBottomBody(),
          ],
        ),

        ),
      ],
    );
  }
}
