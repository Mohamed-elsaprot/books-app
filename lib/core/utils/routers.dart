import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/search/data/repos/search_repo_implement.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presntation/view/auth_screen.dart';
import '../../features/home/data/repos/home_repo_implement.dart';
import '../../features/search/presentation/views/searsh_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';

abstract class AppRouter{
  static const authScreenRouter='/auth';
  static const homeViewRouter='/homeView';
  static const bookDetailsView='/bookDetailsView';
  static const searchView='/searchView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: authScreenRouter,
        builder: (BuildContext context, GoRouterState state) =>
        const AuthScreen(),
      ),
      GoRoute(
        path: homeViewRouter,
        builder :(BuildContext context, GoRouterState state)=> const HomeView()
      ),
      GoRoute(
          path: bookDetailsView,
          builder :(BuildContext context, GoRouterState state)=>
          BlocProvider(create: (context)=> SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BooksDetailsView(
            book: state.extra as BookModel,
          ),
          )

      ),
      GoRoute(
        path: searchView,
        builder: (BuildContext context, GoRouterState state) =>
            BlocProvider(create: (context)=> SearchCubit(getIt.get<SearchRepoImpl>()),
              child: const SearchView(),
            ),
      ),
    ],
  );
}