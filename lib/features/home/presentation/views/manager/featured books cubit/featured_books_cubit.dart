import 'package:bloc/bloc.dart';
import 'package:bookyapp/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../domain/use_case/fetch_feature_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeatureedBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeatureedBooksUseCase fetchFeatureedBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeatureedBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
