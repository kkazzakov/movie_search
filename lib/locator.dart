import 'package:get_it/get_it.dart';
import 'package:movie_search/domain/movie_controller.dart';
import 'package:movie_search/repository/movie_repository.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<MovieRepo>(() => MovieRepo());
  locator.registerLazySingleton<MovieDomainController>(() => MovieDomainController());

}