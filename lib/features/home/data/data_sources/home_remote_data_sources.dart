import 'package:bookyapp/constants.dart';
import 'package:bookyapp/core/utils/api_services.dart';
import 'package:bookyapp/features/home/data/models/book_model/book_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/functions/save_books.dart';
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
    saveData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPont: 'volumes?q=programming&filter=free-ebooks&Sorting=newest');
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
}
