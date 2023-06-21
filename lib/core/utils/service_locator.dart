import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/features/search/data/repos/search_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/auth_repo_implementation.dart';

final getIt= GetIt.instance;

void setupGetItService(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AutheRepoImpl>(AutheRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>() ) );
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl( getIt.get<ApiService>() ) );
}