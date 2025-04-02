import 'package:bookyapp/features/home/domain/entites/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

void saveData(List<BookEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
