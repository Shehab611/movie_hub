import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/usable_functions/api/api_service_helper.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/features/home/data/models/result_model.dart';
import 'package:movie_hub/features/home/domain/entities/movie.dart';
import 'package:movie_hub/features/home/domain/use_cases/get_movies_use_case.dart';
import 'package:movie_hub/features/home/parameters/movie_parameters.dart';

part 'now_playing_state.dart';

part 'popular_state.dart';

part 'similar_state.dart';

part 'top_rated_state.dart';

part 'up_coming_state.dart';

part 'see_more_state.dart';

sealed class HomeCubit<T> extends Cubit<T> {
  HomeCubit(super.initialState);

  ResultModel? model;

  Future<void> _getMovies(
      GetMoviesUseCase getMoviesUseCase, MovieParameters parameters) async {
    emit(switch (state) {
      NowPlayingState() => const NowPlayingLoadingState(),
      PopularState() => const PopularLoadingState(),
      TopRatedState() => const TopRatedLoadingState(),
      UpComingState() => const UpComingLoadingState(),
      SimilarState() => const SimilarLoadingState(),
      SeeMoreState() => const SeeMoreLoadingState(),
      Object() => throw UnimplementedError(),
    } as T);

    final data = await getMoviesUseCase.call(parameters);

    if (data is SuccessDataResponse<ResultModel>) {
      model = data.data;
      emit(switch (state) {
        NowPlayingState() => const NowPlayingSuccessState(),
        PopularState() => const PopularSuccessState(),
        TopRatedState() => const TopRatedSuccessState(),
        UpComingState() => const UpComingSuccessState(),
        SimilarState() => const SimilarSuccessState(),
        SeeMoreState() => const SeeMoreSuccessState(),
        Object() => throw UnimplementedError(),
      } as T);
    } else {
      String error = (data as FailureDataResponse<String>).error;
      emit(switch (state) {
        NowPlayingState() => NowPlayingFailedState(error),
        PopularState() => PopularFailedState(error),
        TopRatedState() => TopRatedFailedState(error),
        UpComingState() => UpComingFailedState(error),
        SimilarState() => SimilarFailedState(error),
        SeeMoreState() => SeeMoreFailedState(error),
        Object() => throw UnimplementedError(),
      } as T);
    }
  }

  void navigateToDetailsScreen(BuildContext context, Movie data) {
    AppNavigator.navigateToDetailsScreen(context, data);
  }
}

class NowPlayingCubit extends HomeCubit<NowPlayingState> {
  final GetMoviesUseCase _useCase;
  final MovieParameters _params = MovieParameters(
      endPoint: ApiEndPoints.nowPlayingMovies,
      languageCode: sl.get<AppLanguage>().appLocale.languageCode);

  NowPlayingCubit(this._useCase) : super(const NowPlayingInitial());

  Future<void> getMovies() async => await super._getMovies(_useCase, _params);
}

class PopularCubit extends HomeCubit<PopularState> {
  final GetMoviesUseCase _useCase;
  final MovieParameters _params = MovieParameters(
      endPoint: ApiEndPoints.popularMovies,
      languageCode: sl.get<AppLanguage>().appLocale.languageCode);

  PopularCubit(this._useCase) : super(const PopularInitial());

  Future<void> getMovies() async => await super._getMovies(_useCase, _params);
}

class TopRatedCubit extends HomeCubit<TopRatedState> {
  final GetMoviesUseCase _useCase;
  final MovieParameters _params = MovieParameters(
      endPoint: ApiEndPoints.topRatedMovies,
      languageCode: sl.get<AppLanguage>().appLocale.languageCode);

  TopRatedCubit(this._useCase) : super(const TopRatedInitial());

  Future<void> getMovies() async => await super._getMovies(_useCase, _params);
}

class UpComingCubit extends HomeCubit<UpComingState> {
  final GetMoviesUseCase _useCase;
  final MovieParameters _params = MovieParameters(
      endPoint: ApiEndPoints.upComingMovies,
      languageCode: sl.get<AppLanguage>().appLocale.languageCode);

  UpComingCubit(this._useCase) : super(const UpComingInitial());

  Future<void> getMovies() async => await super._getMovies(_useCase, _params);
}

class SimilarCubit extends HomeCubit<SimilarState> {
  final GetMoviesUseCase _useCase;

  SimilarCubit(this._useCase) : super(const SimilarInitial());

  Future<void> getMovies(num movieId) async {
    ApiEndPoints.similarMovies = movieId;
    final MovieParameters params = MovieParameters(
        endPoint: ApiEndPoints.similarMovies,
        languageCode: sl.get<AppLanguage>().appLocale.languageCode);
    await super._getMovies(_useCase, params);
  }
}

class SeeMoreCubit extends HomeCubit<SeeMoreState> {
  final GetMoviesUseCase _useCase;
  final ScrollController _scrollController = ScrollController();

  final List<Movie> _movies = [];

  int _page = 2;

  bool _loading = false;

  bool get loading => _loading;

  ScrollController get scrollController => _scrollController;

  List<Movie> get movies => _movies;

  SeeMoreCubit(this._useCase) : super(const SeeMoreInitial());

  Future<List<Movie>> loadMore(String endPoint, int maxPage) async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_loading &&
        _page < maxPage) {
      final MovieParameters params = MovieParameters(
          pageNum: _page,
          endPoint: endPoint,
          languageCode: sl.get<AppLanguage>().appLocale.languageCode);
      _loading = true;
      await super._getMovies(_useCase, params);
      if (state is SimilarSuccessState) {
        _page++;
      }
      _loading = false;
      return model!.movies;
    }
    return model!.movies;
  }
}
