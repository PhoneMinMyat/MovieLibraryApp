import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieModel{
   Future<List<MovieVO>?> getNowPlayingMovies();

}