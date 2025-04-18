import 'package:flutter/material.dart';

import '../../../features/home/presentation/views/manager/featured books cubit/featured_books_cubit.dart';

SnackBar buildSnackBar(FeaturedBooksPaginationFailure state) {
  return SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        state.errMessage,
        style: TextStyle(color: Colors.white),
      ));
}
