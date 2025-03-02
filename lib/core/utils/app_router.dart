import 'package:bookyapp/features/home/presentation/views/book_view_deatils.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookyapp/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kbook = '/bookviewdeatils';
  static const kSearchView = '/searchView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
          path: kSearchView, builder: (context, state) => const SearchView()),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      ),
      GoRoute(
        path: kbook,
        builder: (BuildContext context, GoRouterState state) {
          return const BookViewDeatils();
        },
      ),
    ],
  );
}
