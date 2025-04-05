import 'package:bookyapp/features/home/presentation/views/book_view_deatils.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookyapp/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/domain/entites/book_entity.dart';
import '../../features/home/presentation/views/home.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  final BookEntity book;
  static const kbook = '/bookviewdeatils';
  static const kSearchView = '/searchView';
  AppRouter(this.book);
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
          final book = state.extra as BookEntity;
          return BookViewDeatils(book: book);
        },
      ),
    ],
  );
}
