import 'package:bookyapp/constants.dart';
import 'package:bookyapp/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: primaryColor),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
