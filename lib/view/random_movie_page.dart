import 'package:flutter/material.dart';
import 'package:movie_search/domain/models/movie.dart';
import 'package:movie_search/domain/movie_controller.dart';
import 'package:movie_search/locator.dart';

class RandomMoviePageView extends StatefulWidget {
  const RandomMoviePageView({super.key});

  @override
  State<RandomMoviePageView> createState() => _RandomMoviePageViewState();
}

class _RandomMoviePageViewState extends State<RandomMoviePageView> {
  Movie? visibleMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Search"),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Center(
              child: visibleMovie != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 300,
                          child: Image.network(visibleMovie!.imageUrl),
                        ),
                        Text(visibleMovie!.name)
                      ],
                    )
                  : Container(
                      child: Text(
                          "Испытай удачу, нажми на кнопку для показа случайного фильма!"),
                    ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () async {
          Movie movie =
              await locator.get<MovieDomainController>().getRandomMovie();
          setState(() {
            visibleMovie = movie;
          });
        },
      ),
    );
  }
}
