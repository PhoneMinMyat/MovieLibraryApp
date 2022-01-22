import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieDataAgent{
  Future<List<MovieVO>?> getNowPlayingMovies(int page);
}