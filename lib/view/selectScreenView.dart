import 'package:flutter/material.dart';
import 'package:movie_search/view/random_movie_page.dart';
import 'package:movie_search/view/searchByNamePage.dart';

class SelectScreenView extends StatelessWidget {
  const SelectScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RandomMoviePageView()));
            }, child: Text('Случайный фильм')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchByNamePage()));
            }, child: Text('Поиск фильма по названию'))
          ],
        ),
      ),
    );
  }
}
