import 'package:bookyapp/features/home/data/models/book_model/equb.dart';
import 'package:bookyapp/features/home/data/models/book_model/saleInfo.dart';
import 'package:bookyapp/features/home/data/models/book_model/searchInfo.dart';
import 'package:bookyapp/features/home/data/models/book_model/volume_info.dart';
import 'package:bookyapp/features/home/domain/entites/book_entity.dart';

import 'accessInfo.dart';

class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo})
      : super(
            imagePath: volumeInfo?.imageLinks?.thumbnail ?? '',
            title: volumeInfo!.title!,
            authorName: volumeInfo?.authors?.first ?? 'Unknown Author',
            price: 0.0,
            rating: volumeInfo.averageRating!,
            bookId: id!);

  BookModel.fromJson(Map<String, dynamic> json)
      : super(
            imagePath: json['volumeInfo']?['imageLinks']?['thumbnail'] ?? '',
            title: json['volumeInfo']?['title'] ?? 'Unknown Title',
            authorName: (json['volumeInfo']?['authors'] as List?)?.first ??
                'Unknown Author',
            price: 0.0,
            rating: (json['volumeInfo']?['averageRating'] ?? 0).toDouble(),
            bookId: json['id'] ?? '') {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? VolumeInfo.fromJson(json['volumeInfo'])
        : null;
    saleInfo =
        json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null
        ? AccessInfo.fromJson(json['accessInfo'])
        : null;
    searchInfo = json['searchInfo'] != null
        ? SearchInfo.fromJson(json['searchInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['id'] = id;
    data['etag'] = etag;
    data['selfLink'] = selfLink;
    if (volumeInfo != null) {
      data['volumeInfo'] = volumeInfo!.toJson();
    }
    if (saleInfo != null) {
      data['saleInfo'] = saleInfo!.toJson();
    }
    if (accessInfo != null) {
      data['accessInfo'] = accessInfo!.toJson();
    }
    if (searchInfo != null) {
      data['searchInfo'] = searchInfo!.toJson();
    }
    return data;
  }
}
