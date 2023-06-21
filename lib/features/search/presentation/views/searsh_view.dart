import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SearchViewState();
  }
}

class SearchViewState extends State{

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context).fetchSearchResult();
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
          child: SearchViewBody()
      ),
    );
  }

}
