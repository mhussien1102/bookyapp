import 'package:bookyapp/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entites/book_entity.dart';

class FetchFeatureedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeatureedBooksUseCase(this.homeRepo);
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    return homeRepo.fetchFeaturedBooks();
  }
}
