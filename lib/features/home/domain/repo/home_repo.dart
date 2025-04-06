import 'dart:async';
import 'package:bookyapp/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:bookyapp/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
