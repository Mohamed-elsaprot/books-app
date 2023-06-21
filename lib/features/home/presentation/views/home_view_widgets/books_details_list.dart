import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/loading_indecator.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:bookly/features/home/presentation/manager/news_books_cubit/news_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/news_books_cubit/news_books_state.dart';
import 'package:bookly/features/home/presentation/views/home_view_widgets/books_cover_list.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/routers.dart';

class BooksDetailsList extends StatelessWidget {
  const BooksDetailsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<NewsBooksCubit,NewsBooksState>(
      builder: (context,state) {
        if(state is NewsBooksSuccess){
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.books.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * .02),
                  child: BookItem(bookModel: state.books[index],),
                );
              });
        }else if(state is NewsBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return const LoadingIndicator();
        }
      }
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView,extra: bookModel);
        print(bookModel.volumeInfo.imageLinks?.thumbnail);
      },
      child:Card(
            color: Colors.transparent,
            elevation: 0,
            child: SizedBox(
                height: size.height * .17,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width*.23,
                      child: BookCoverItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRucpvmQPFPFFQ2PomrKQh9zw7AV_OROfs6pg&usqp=CAU'),
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context,constrain) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * .5,
                                child: Styles.LabradaText(
                                    text: bookModel.volumeInfo.title!,
                                    size: 20,
                                    weight: FontWeight.bold,
                                    color: Colors.white,
                                    maxLines: 1
                                ),
                              ),
                              SizedBox(
                                height: size.height * .01,
                              ),
                               Text(
                                bookModel.volumeInfo.authors?[0]?? 'not found',
                                style: const TextStyle(fontSize: 14),
                                 maxLines: 1,
                              ),
                              SizedBox(height: constrain.maxHeight*.15,),
                              Row(
                                children: [
                                  Styles.LabradaText(
                                      text: 'Free', size: 20, weight: FontWeight.bold,color: Colors.white),
                                  const Spacer(),
                                  SizedBox(child: BookRating(
                                    rating: bookModel.volumeInfo.ratingsCount??3,
                                    count: bookModel.volumeInfo.ratingsCount??265,
                                  ))
                                ],
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                  ],
                ),
            ),
          )
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({Key? key, this.mainAxisAlignment = MainAxisAlignment.start,required this.count,required this.rating})
      : super(key: key);
  final MainAxisAlignment mainAxisAlignment;
  final num count;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          ' $rating ',
          style: TextStyle(fontSize: 16),
        ),
        Text('($count)',
            style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 14,
                fontWeight: FontWeight.w600))
      ],
    );
  }
}



