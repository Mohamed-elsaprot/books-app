import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../home_view_widgets/books_details_list.dart';
import 'books_action_button.dart';
import '../home_view_widgets/books_cover_list.dart';
import '../home_view_widgets/custom_book_detials_appbar.dart';

class BookDetailsTopBody extends StatelessWidget {
  const BookDetailsTopBody({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .18, vertical: size.height * .02),
                  child: SizedBox(
                      height: size.height * .3, child: BookCoverItem(
                    imageUrl: //'https://miblart.com/wp-content/uploads/2020/01/crime-and-mystery-cover-scaled-1.jpeg'
                    bookModel.volumeInfo.imageLinks?.thumbnail??'',
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Styles.LabradaText(
                    size: 30,
                    weight: FontWeight.w600,
                    text:  bookModel.volumeInfo.title!,
                    maxLines: 1,
                    color: Colors.white,
                    textAlign: TextAlign.center
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  bookModel.volumeInfo.authors?[0]?? 'Unknown Author',
                  style: Styles.titleMedium.copyWith(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 14,
                ),
                BookRating(mainAxisAlignment: MainAxisAlignment.center,
                  count: bookModel.volumeInfo.ratingsCount?? 0,
                  rating: bookModel.volumeInfo.ratingsCount?? 0,),
                const SizedBox(
                  height: 37,
                ),
                BooksAction(bookModel: bookModel)
              ],
            ),
          )
        ]
    );

  }
}

