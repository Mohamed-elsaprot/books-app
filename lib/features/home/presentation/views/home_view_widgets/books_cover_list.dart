import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cupit/featured_books_cupit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cupit/featured_books_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/routers.dart';
import '../../../../../core/widgets/loading_indecator.dart';
import 'package:cached_network_image/cached_network_image.dart';


class BooksCoverList extends StatelessWidget {
  const BooksCoverList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder:(context,state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(
            height: MediaQuery.of(context).size.height*.30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.bookDetailsView,
                        extra: state.books[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BookCoverItem(
                        imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRucpvmQPFPFFQ2PomrKQh9zw7AV_OROfs6pg&usqp=CAU'
                    ),
                  ),
                );
              },
            ),
          );
        }
        else if( state is FeaturedBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else{
          return const LoadingIndicator();
        }
      }
    );
  }
}

class BookCoverItem extends StatelessWidget {
  const BookCoverItem({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: AspectRatio(
          aspectRatio: 2.6/4,
          child: CachedNetworkImage(
            placeholder: (context,url)=> const Center(child: CircularProgressIndicator(),),
            errorWidget: (context,url,error)=> Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Icon(Icons.error_outline),
                  Text('No Image Found.',textAlign: TextAlign.center,),
              ],
            ),
            imageUrl: imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      );
  }
}

