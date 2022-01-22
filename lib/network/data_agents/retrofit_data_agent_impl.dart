import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/data_agents/movie_data_agent.dart';
import 'package:movie_app/network/the_movie_api.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  late TheMovieApi mApi;

  static final RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
  return  mApi
        .getNowPlayingMovieData(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((respone) => respone.results).first;
  }
}
