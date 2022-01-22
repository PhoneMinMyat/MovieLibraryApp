import 'package:dio/dio.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/responses/get_now_playing_responses.dart';
import 'package:retrofit/http.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINTS_GET_NOW_PLAYING)
  Future<GetNowPlayingResponses> getNowPlayingMovieData(@Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language, @Query(PARAM_PAGE) String page);
}
