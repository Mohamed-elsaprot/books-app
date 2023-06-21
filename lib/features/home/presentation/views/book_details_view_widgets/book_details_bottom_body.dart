import 'package:bookly/features/home/presentation/views/book_details_view_widgets/recommended_books_list.dart';
import 'package:flutter/material.dart';

class BookDetailsBottomBody extends StatelessWidget {
  const BookDetailsBottomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('You can also like'),
        ),
        SizedBox(height: 15,),
        RecommendedBooksList(),
      ],
    );
  }
}
