part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}
