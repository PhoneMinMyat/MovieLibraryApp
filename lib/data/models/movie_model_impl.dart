import 'dart:ui';

import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/data_agents/movie_data_agent.dart';
import 'package:movie_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:movie_app/persistence/daos/actor_dao.dart';
import 'package:movie_app/persistence/daos/genre_dao.dart';
import 'package:movie_app/persistence/daos/movie_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieModelImpl extends MovieModel {
  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  MovieModelImpl._internal();

  //Daos
  MovieDao mMovieDao = MovieDao();
  ActorDao mActorDao = ActorDao();
  GenreDao mGenreDao = GenreDao();

  //network

  final MovieDataAgent _dataAgent = RetrofitDataAgentImpl();
  @override
  void getNowPlayingMovies() {
    _dataAgent.getNowPlayingMovies(1).then((movies) async {
      List<MovieVO>? nowPlayingMovieList = movies?.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(nowPlayingMovieList ?? []);
    });
  }

  @override
  void getPopularMovies() {
    _dataAgent.getPopularMovies(1).then((movies) async {
      List<MovieVO>? popularMovieList = movies?.map((movie) {
        movie.isPopular = true;
        movie.isTopRated = false;
        movie.isNowPlaying = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(popularMovieList ?? []);
    });
  }

  @override
  void getTopRatedMovies() {
    _dataAgent.getTopRatedMovies(1).then((movies) async {
      List<MovieVO>? topRatedMovieList = movies?.map((movie) {
        movie.isTopRated = true;
        movie.isPopular = false;
        movie.isNowPlaying = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(topRatedMovieList ?? []);
    });
  }

  @override
  void getActors() {
    _dataAgent.getActors(1).then((actors) async {
      mActorDao.saveAllActors(actors ?? []);
    });
  }

  @override
  void getGenres() {
    _dataAgent.getGenres().then((genres) async {
      mGenreDao.saveAllGenres(genres ?? []);
      getMoviesByGenre(genres?.first.id ?? 0);
    });
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenre(int genreId) {
    return _dataAgent.getMoviesByGenre(genreId);
  }

  @override
  Future<List<List<ActorVO>?>> getCreditByMovie(int movieId) {
    return _dataAgent.getCreditByMovie(movieId);
  }

  @override
  void getMovieDetails(int movieId) {
    _dataAgent.getMovieDetails(movieId)?.then((movie) async {
      mMovieDao.saveSingleMovie(movie);
    });
  }

  ///Database

  @override
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    getNowPlayingMovies();
    return Future.value(mMovieDao.getNowPlayingMovie());
  }

  @override
  Future<List<MovieVO>> getPopularMoviesFromDatabase() {
    getPopularMovies();
    return Future.value(mMovieDao.getPopularMovies());
        
  }

  @override
  Future<List<MovieVO>> getTopRatedMoviesFromDatabase() {
    getTopRatedMovies();
    return Future.value(mMovieDao.getTopRatedMovies());
  }

  @override
  Future<List<ActorVO>> getActorsFromDatabase() {
    getActors();
    return Future.value(mActorDao.getAllActors());
  }

  @override
  Future<List<GenreVO>> getGenresFromDatabase() {
    getGenres();
    return Future.value(mGenreDao.getAllGenres());
  }

  @override
  Future<MovieVO?> getMovieDetailsFromDatabase(int movieId) {
    getMovieDetails(movieId);
    return Future.value(mMovieDao.getSingleMovieById(movieId));
  }
}
