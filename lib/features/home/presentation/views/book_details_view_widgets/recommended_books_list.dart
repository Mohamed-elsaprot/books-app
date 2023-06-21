import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/loading_indecator.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/routers.dart';
import '../home_view_widgets/books_cover_list.dart';

class RecommendedBooksList extends StatelessWidget {
  const RecommendedBooksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context,state) {
        if(state is SimilarBooksSuccess){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*.16,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).pushReplacement(AppRouter.bookDetailsView,extra: state.books[index]);
                      },
                      child: BookCoverItem(
                        imageUrl: //'https://miblart.com/wp-content/uploads/2020/01/crime-and-mystery-cover-scaled-1.jpeg'
                        state.books[index].volumeInfo.imageLinks?.thumbnail?? '',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }else if(state is SimilarBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return const Padding(
            padding: EdgeInsets.all(50),
            child: LoadingIndicator(),
          );
        }
      }
    );
  }
}
