import 'package:bookyapp/core/utils/api_services.dart';
import 'package:bookyapp/features/home/data/models/book_model/book_model.dart';

import '../../domain/entites/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  final ApiServices apiServices;

  HomeRemoteDataSourcesImpl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
        endPont: 'volumes?filter=free-ebooks&q=programming');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
