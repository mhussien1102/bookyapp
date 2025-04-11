import 'package:bookyapp/features/home/presentation/views/manager/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/book_entity.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedListView> createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollExtent) {
      BlocProvider.of<FeaturedBooksCubit>(context)
          .fetchFeaturedBooks(pageNumber: nextPage);
      nextPage++;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomListViewItem(
              image: widget.books[index].imagePath ?? ' ',
            ),
          );
        },
      ),
    );
  }
}
