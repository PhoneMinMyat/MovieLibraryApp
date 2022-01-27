import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/data_agents/movie_data_agent.dart';
import 'package:movie_app/network/data_agents/retrofit_data_agent_impl.dart';

class MovieModelImpl implements MovieModel {
  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  MovieModelImpl._internal();

  final MovieDataAgent _dataAgent = RetrofitDataAgentImpl();
  @override
  Future<List<MovieVO>?> getNowPlayingMovies() {
    return _dataAgent.getNowPlayingMovies(1);
  }

  @override
  Future<List<MovieVO>?> getPopularMovies() {
    return _dataAgent.getPopularMovies(1);
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies() {
    return _dataAgent.getTopRatedMovies(1);
  }

  @override
  Future<List<ActorVO>?> getActors() {
    return _dataAgent.getActors(1);
  }

  @override
  Future<List<GenreVO>?> getGenres() {
    return _dataAgent.getGenres();
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenre(int genreId) {
    return _dataAgent.getMoviesByGenre(genreId);
  }
}
