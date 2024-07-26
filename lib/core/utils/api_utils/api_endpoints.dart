part of '../../usable_functions/api/api_service_helper.dart';

abstract final class ApiEndPoints {
  //#region Private variables can not be accessed

  //#region Basic Configurations

  static const String _host = 'https://api.themoviedb.org';
  static const String _version = '$_host/3';

  //#endregion

  //#region EndPoints
  static const String _movie = '/movie';

  static const String _nowPlayingMovies = '$_movie/now_playing';

  static const String _popularMovies = '$_movie/popular';

  static const String _topRatedMovies = '$_movie/top_rated';

  static const String _upComingMovies = '$_movie/upcoming';

  static String _similarMovies = '';

  static const String _imagesBaseUrl = 'https://image.tmdb.org/t/p/w500';
  //#endregion

  //#region setters
  static set similarMovies(movieId) =>
      _similarMovies = '/$_movie/$movieId/similar';

  //#endregion

  //#endregion

  //#region Getters to use them in the app
  //#region Basic Configurations
  ///Api base url
  static String get baseUrl => _version;

  //#endregion
  //#region EndPoints
  static String get nowPlayingMovies => _nowPlayingMovies;

  static String get popularMovies => _popularMovies;

  static String get topRatedMovies => _topRatedMovies;

  static String get upComingMovies => _upComingMovies;

  static String get similarMovies => _similarMovies;

  static String get imagesBaseUrl => _imagesBaseUrl;

//#endregion

//#endregion
}
