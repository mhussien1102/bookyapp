import 'package:bookyapp/core/errors/failure.dart';

import 'package:bookyapp/features/home/domain/entites/book_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repo/home_repo.dart';
import '../data_sources/home_local_data_source.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSources homeRemoteDataSource;
  final HomeLocalDataSources homeLocalDataSource;

  HomeRepoImp(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchFeaturedBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
