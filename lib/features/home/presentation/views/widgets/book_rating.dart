import 'package:bookyapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/entites/book_entity.dart';

class BookRating extends StatelessWidget {
  final BookEntity book;
  final MainAxisAlignment mainAxisAlignment;
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffffdda4),
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          "${book.rating}",
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "(2390)",
          style: Styles.textStyle14.copyWith(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
