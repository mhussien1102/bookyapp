import 'package:flutter/material.dart';

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Colors.red,
          )),
    );
  }
}
