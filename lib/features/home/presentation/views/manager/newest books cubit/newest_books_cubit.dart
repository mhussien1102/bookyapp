import 'package:bloc/bloc.dart';
import 'package:bookyapp/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entites/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) => emit(NewestBooksFailure(failure.message)),
        (books) => emit(NewestBooksSuccess(books)));
  }
}
