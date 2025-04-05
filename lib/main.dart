import 'package:bookyapp/constants.dart';
import 'package:bookyapp/core/utils/app_router.dart';

import 'package:bookyapp/features/home/data/repos/home_repo_imp.dart';
import 'package:bookyapp/features/home/domain/entites/book_entity.dart';
import 'package:bookyapp/features/home/domain/use_case/fetch_feature_books_use_case.dart';
import 'package:bookyapp/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:bookyapp/features/home/presentation/views/manager/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookyapp/features/home/presentation/views/manager/newest%20books%20cubit/newest_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/functions/setup_service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupServiceLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

final getit = GetIt.instance;

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) {
          return FeaturedBooksCubit(
            FetchFeatureedBooksUseCase(
              getit.get<HomeRepoImp>(),
            ),
          )..fetchFeaturedBooks();
        }),
        BlocProvider(create: (BuildContext context) {
          return NewestBooksCubit(
            FetchNewestBooksUseCase(
              getit.get<HomeRepoImp>(),
            ),
          )..fetchNewestBooks();
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
