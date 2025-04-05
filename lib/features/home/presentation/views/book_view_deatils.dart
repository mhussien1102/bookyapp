import 'package:bookyapp/features/home/presentation/views/widgets/book_view_details_body.dart';
import 'package:flutter/material.dart';

import '../../domain/entites/book_entity.dart';

class BookViewDeatils extends StatelessWidget {
  const BookViewDeatils({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookViewDetailsBody(
          book: book,
        ),
      ),
    );
  }
}
