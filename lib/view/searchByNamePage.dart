import 'package:flutter/material.dart';
import 'package:movie_search/domain/models/movie.dart';

import '../domain/movie_controller.dart';
import '../locator.dart';

class SearchByNamePage extends StatefulWidget {
  const SearchByNamePage({super.key});

  @override
  State<SearchByNamePage> createState() => _SearchByNamePageState();
}

class _SearchByNamePageState extends State<SearchByNamePage> {
  List<Movie>? movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Search"),
      ),
      body: Column(
        children: [
          TextField(onSubmitted: (text) async{
            movies = await locator.get<MovieDomainController>().searchByName(name: text);
            setState(() {

            });
          },),
          Expanded(child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                  child: movies != null
                      ? ListView.builder(
                      itemCount: movies?.length,
                      itemBuilder: (context, index){
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: ListTile(
                            leading: Image.network(movies![index].imageUrl),
                            title: Text(movies![index].name),
                          ),
                        );
                      }
                  )
                      : Container(
                    child: Text(
                        "Напишите название и найдите свой фильм!"),
                  ))))
        ],
      ),
    );
  }
}
