import 'package:bookly/core/widgets/loading_indecator.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/home_view_widgets/books_details_list.dart';


class SearchListResult extends StatelessWidget {
  const SearchListResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context,state) {
        if(state is SearchSuccess){
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: BookItem(bookModel: state.books[index]),
                );
              }
          );
        }
        else if(state is SearchFailure){
          print('search error: ${state.errorMessage}');
          return const CustomErrorWidget(errorMessage: 'Sorry No Books with this search title',);
        }else {
          return const LoadingIndicator();
        }
      }
    );
  }
}
