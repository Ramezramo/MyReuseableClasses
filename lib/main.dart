import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'Features/home/data/repos/home_repo_impl.dart';
// import 'Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
// import 'Features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'constants.dart';
// import 'core/utils/app_router.dart';
import 'core/utils/app_router.dart';
// import 'core/utils/service_locator.txt';
import 'package:bloc/bloc.dart';

import 'core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const appName());
}

class appName extends StatelessWidget {
  const appName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        // textTheme:
        //     GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
