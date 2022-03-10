import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistence/hive_constants.dart';

class MovieDao {
  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal();

  void saveMovies(List<MovieVO> movieList) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(movieList,
        key: (movie) => movie.id, value: (movie) => movie);

    await getMovieBox().putAll(movieMap);
  }

  void saveSingleMovie(MovieVO movie) async {
    await getMovieBox().put(movie.id, movie);
  }

  List<MovieVO> getAllMovies() {
    return getMovieBox().values.toList();
  }

  MovieVO? getSingleMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }

  /// Reactive Programming

  Stream<void> getAllMoviesEventStream() {
    return getMovieBox().watch();
  }

  List<MovieVO> getNowPlayingMovie() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((element) => element.isNowPlaying ?? false)
          .toList();
    } else {
      return [];
    }
  }

  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(getNowPlayingMovie());
  }

  List<MovieVO> getPopularMovies() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((element) => element.isPopular ?? false)
          .toList();
    } else {
      return [];
    }
  }

  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(getPopularMovies());
  }

  List<MovieVO> getTopRatedMovies() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((element) => element.isTopRated ?? false)
          .toList();
    } else {
      return [];
    }
  }

  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(getTopRatedMovies());
  }

  Stream<MovieVO?> getMovieDetailsByMovieIDStream(int movieId) {
    return Stream.value(getSingleMovieById(movieId));
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(BOX_NAME_MOVIE_VO);
  }
}
