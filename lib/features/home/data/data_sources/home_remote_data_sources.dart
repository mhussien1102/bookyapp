import '../../domain/entites/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
