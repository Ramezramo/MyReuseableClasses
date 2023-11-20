// import 'package:bookly_app_with_tharwat/Features/home/data/repos/home_repo_impl.dart';
// import 'package:bookly_app_with_tharwat/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.txt';

// import '../../Features/home/data/repos/home_repo_impl.dart';
// import 'api_service.txt';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  // getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
}
