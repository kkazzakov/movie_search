import 'package:movie_search/repository/movie_repository.dart';
import 'package:movie_search/locator.dart';
class MovieDomainController {
  getRandomMovie() async{
    return locator.get<MovieRepo>().getRandomMovie();
  }

  searchByName({required String name}){
    return locator.get<MovieRepo>().searchByName(name: name);
  }
}