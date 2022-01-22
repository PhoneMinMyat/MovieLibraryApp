// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'the_movie_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TheMovieApi implements TheMovieApi {
  _TheMovieApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.themoviedb.org';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetNowPlayingResponses> getNowPlayingMovieData(
      apiKey, language, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'language': language,
      r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetNowPlayingResponses>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/3/movie/now_playing',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetNowPlayingResponses.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
