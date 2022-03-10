import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieModel {
  //Network
  void getNowPlayingMovies();
  void getPopularMovies();
  void getTopRatedMovies();
  void getActors();
  void getGenres();
  Future<List<MovieVO>?> getMoviesByGenre(int genreId);
  void getMovieDetails(int movieId);
  Future<List<List<ActorVO>?>> getCreditByMovie(int movieId);

  //Database
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Future<List<MovieVO>> getPopularMoviesFromDatabase();
  Future<List<MovieVO>> getTopRatedMoviesFromDatabase();
  Future<List<ActorVO>> getActorsFromDatabase();
  Future<List<GenreVO>> getGenresFromDatabase();
  Future<MovieVO?> getMovieDetailsFromDatabase(int movieId);
}
