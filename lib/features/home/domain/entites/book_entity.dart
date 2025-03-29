class BookEntity {
  final String bookId;
  final String? imagePath;
  final String title;
  final String? authorName;
  final num? price;
  final num rating;

  BookEntity(
      {required this.imagePath,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating,
      required this.bookId});
}
