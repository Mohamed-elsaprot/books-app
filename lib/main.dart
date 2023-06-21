import 'package:bookly/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cupit/featured_books_cupit.dart';
import 'package:bookly/features/home/presentation/manager/news_books_cubit/news_books_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constant.dart';
import 'core/utils/routers.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/data/auth_repo_implementation.dart';
import 'features/auth/presntation/manager/auth_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupGetItService();
  runApp(const BooklyApp());

}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => FeaturedBooksCubit(
                    getIt.get<HomeRepoImpl>(),
                  )),
          BlocProvider(
              create: (context) => NewsBooksCubit(
                    getIt.get<HomeRepoImpl>(),
                  )..fetchNewsBooks()
          ),
          BlocProvider(
              create: (context) => AuthCubit(
                  getIt.get<AutheRepoImpl>()
              )
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: scaffoldColor,
          ),
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
        ));
  }
}