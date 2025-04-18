import 'package:bookyapp/features/home/domain/entites/book_entity.dart';
import 'package:bookyapp/features/home/presentation/views/manager/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewBlocBuilder extends StatefulWidget {
  const FeaturedListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedListViewBlocBuilder> createState() =>
      _FeaturedListViewBlocBuilderState();
}

class _FeaturedListViewBlocBuilderState
    extends State<FeaturedListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading) {
          return FeaturedListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
