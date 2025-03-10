import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entites/book_entity.dart';
import '../repo/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoPrama> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoPrama? prama]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
