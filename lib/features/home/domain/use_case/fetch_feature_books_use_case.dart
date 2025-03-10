import 'package:bookyapp/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entites/book_entity.dart';

class FetchFeatureedBooksUseCase extends UseCase<List<BookEntity>, NoPrama> {
  final HomeRepo homeRepo;

  FetchFeatureedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoPrama? prama]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
