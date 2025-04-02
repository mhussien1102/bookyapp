import 'package:bookyapp/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

import '../../../../constants.dart';

abstract class HomeRemoteDataSources {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSources extends HomeRemoteDataSources {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
