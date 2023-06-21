import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/routers.dart';
import '../../manager/featured_books_cupit/featured_books_cupit.dart';
import 'books_details_list.dart';
import 'books_cover_list.dart';
import 'package:flutter/material.dart';
import 'custom_home_app_bar.dart';
import 'package:bookly/core/utils/styles.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeViewBodyState();
  }
}

class HomeViewBodyState extends State {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomAppBar(),
              BooksCoverList(),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Text('Newest Books', style: Styles.titleMedium)),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*.05),
            child: const BooksDetailsList(),
          ),
        )
      ],
    );
  }
}






//SliverFillViewport(
//           viewportFraction: 1.95,
//           delegate: SliverChildListDelegate([
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: size.width*.05),
//               child: const BooksDetailsList(),
//             )
//           ]),
//         ),
