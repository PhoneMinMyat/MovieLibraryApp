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

  MovieModelImpl._internal() {
    getNowPlayingMoviesFromDatabase();
    getPopularMoviesFromDatabase();
    getNowPlayingMoviesFromDatabase();
    getActors();
    getActorsFromDatabase();
    getGenres();
    getGenresFromDatabase();
  }

  //Daos
  MovieDao mMovieDao = MovieDao();
  ActorDao mActorDao = ActorDao();
  GenreDao mGenreDao = GenreDao();

  ///Home Page State Variable
  List<MovieVO>? mNowPlayingMovieList;
  List<MovieVO>? mPopularMovieList;
  List<MovieVO>? mTopRatedMovieList;
  List<ActorVO>? mActorsList;
  List<GenreVO>? mGenresList;
  List<MovieVO>? mMoviesByGenreList;

  ///Details Page State Variables
  MovieVO? mMovie;
  List<ActorVO>? mCast;
  List<ActorVO>? mCrew;

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
      mNowPlayingMovieList = nowPlayingMovieList;
      notifyListeners();
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
      mPopularMovieList = popularMovieList;
      notifyListeners();
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
      mTopRatedMovieList = topRatedMovieList;
      notifyListeners();
    });
  }

  @override
  void getActors() {
    _dataAgent.getActors(1).then((actors) async {
      mActorDao.saveAllActors(actors ?? []);
      mActorsList = actors;
      notifyListeners();
    });
  }

  @override
  void getGenres() {
    _dataAgent.getGenres().then((genres) async {
      mGenreDao.saveAllGenres(genres ?? []);
      mGenresList = genres;
      getMoviesByGenre(genres?.first.id ?? 0);
      notifyListeners();
    });
  }

  @override
  void getMoviesByGenre(int genreId) {
    _dataAgent.getMoviesByGenre(genreId).then((movieList) {
      mMoviesByGenreList = movieList;
      notifyListeners();
    });
  }

  @override
  void getCreditByMovie(int movieId) {
    _dataAgent.getCreditByMovie(movieId).then((actorAndCrew) {
      mCast = actorAndCrew.first;
      mCrew = actorAndCrew[1];
      notifyListeners();
    });
  }

  @override
  void getMovieDetails(int movieId) {
    _dataAgent.getMovieDetails(movieId)?.then((movie) async {
      mMovieDao.saveSingleMovie(movie);
      mMovie = movie;
      notifyListeners();
    });
  }

  ///Database

  @override
  void getNowPlayingMoviesFromDatabase() {
    getNowPlayingMovies();
    mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .map((event) => mMovieDao.getNowPlayingMovie())
        .first
        .then((nowPlayingMovie) {
      mNowPlayingMovieList = nowPlayingMovie;
      notifyListeners();
    });
  }

  @override
  void getPopularMoviesFromDatabase() {
    getPopularMovies();
    mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getPopularMoviesStream())
        .map((event) => mMovieDao.getPopularMovies())
        .first
        .then((popularMovies) {
      mPopularMovieList = popularMovies;
      notifyListeners();
    });
  }

  @override
  void getTopRatedMoviesFromDatabase() {
    getTopRatedMovies();
    mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .map((event) => mMovieDao.getTopRatedMovies())
        .first
        .then((topratedMovies) {
      mTopRatedMovieList = topratedMovies;
      notifyListeners();
    });
  }

  @override
  void getActorsFromDatabase() {
    mActorsList = mActorDao.getAllActors();
    notifyListeners();
  }

  @override
  void getGenresFromDatabase() {
    mGenresList = mGenreDao.getAllGenres();
    notifyListeners();
  }

  @override
  void getMovieDetailsFromDatabase(int movieId) {
    mMovie = mMovieDao.getSingleMovieById(movieId);
    notifyListeners();
  }
}
