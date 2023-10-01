import 'package:flutter/material.dart';
import 'package:movie_search/locator.dart';
import 'package:movie_search/view/random_movie_page.dart';
import 'package:movie_search/view/selectScreenView.dart';
void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Demo',
      home: SelectScreenView(),
    );
  }
}




