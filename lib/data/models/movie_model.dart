import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieModel {
  //Network
  void getNowPlayingMovies(int pageIndex);
  void getPopularMovies();
  void getTopRatedMovies();
  void getActors();
  void getGenres();
  Future<List<MovieVO>?> getMoviesByGenre(int genreId);
  void getMovieDetails(int movieId);
  Future<List<List<ActorVO>?>> getCreditByMovie(int movieId);

  //Database
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Stream<List<MovieVO>> getPopularMoviesFromDatabase();
  Stream<List<MovieVO>> getTopRatedMoviesFromDatabase();
  Stream<List<ActorVO>> getActorsFromDatabase();
  Stream<List<GenreVO>> getGenresFromDatabase();
  Stream<MovieVO?> getMovieDetailsFromDatabase(int movieId);
}
