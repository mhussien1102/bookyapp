import 'package:bookyapp/features/home/presentation/views/widgets/customBookDeatilsAppBar.dart';
import 'package:flutter/material.dart';

class BookViewDetailsBody extends StatelessWidget {
  const BookViewDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [CustomBookDeatialsAppBar()],
      ),
    );
  }
}
