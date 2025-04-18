import 'package:bookyapp/core/widgets/custom_button.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/book_action_button.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/customBookDeatilsAppBar.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/similiar_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import '../../../domain/entites/book_entity.dart';
import 'custom_list_view_item.dart';

class BookViewDetailsBody extends StatelessWidget {
  const BookViewDetailsBody({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                BookDetailsSections(
                  book: book,
                ),
                const SizedBox(
                  height: 37,
                ),
                BookActionBButton(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("you can also like",
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 16,
                ),
                SimilarBookListView(),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BookDetailsSections extends StatelessWidget {
  const BookDetailsSections({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CustomBookDeatialsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomListViewItem(
            image: " ",
          ),
        ),
        SizedBox(
          height: 43,
        ),
        Text("The Jungle Book", style: Styles.textStyle30),
        SizedBox(
          height: 6,
        ),
        Text("Richard Klyping",
            style: Styles.textStyle18.copyWith(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            )),
        SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          book: book,
        ),
      ],
    );
  }
}
