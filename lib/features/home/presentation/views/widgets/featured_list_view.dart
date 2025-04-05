import 'package:bookyapp/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

import '../../../domain/entites/book_entity.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomListViewItem(
                image: books[index].imagePath ?? ' ',
              ),
            );
          }),
    );
  }
}
