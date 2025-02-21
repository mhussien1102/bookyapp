import 'package:bookyapp/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookActionBButton extends StatelessWidget {
  const BookActionBButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: 16,
            text: '19.99',
          )),
          Expanded(
              child: CustomButton(
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: 16,
            text: 'Free Preview',
          )),
        ],
      ),
    );
  }
}
