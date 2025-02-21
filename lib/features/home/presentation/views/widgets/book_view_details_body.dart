import 'package:bookyapp/features/home/presentation/views/widgets/customBookDeatilsAppBar.dart';
import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class BookViewDetailsBody extends StatelessWidget {
  const BookViewDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomBookDeatialsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .17),
            child: CustomListViewItem(),
          )
        ],
      ),
    );
  }
}
