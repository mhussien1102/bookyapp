import 'package:bloc/bloc.dart';
import 'package:bookyapp/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../domain/use_case/fetch_feature_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeatureedBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeatureedBooksUseCase fetchFeatureedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeatureedBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(failure.message));
      } else {
        emit(FeaturedBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
