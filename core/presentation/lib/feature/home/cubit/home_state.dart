part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.init() = HomeInitial;
  const factory HomeState.loading(bool isLoading) = HomeLoadingState;
  const factory HomeState.loaded(
    List<LoadBookResult> trendingBooks,
    List<LoadBookResult> popularBooks,
  ) = HomeLoadedState;
  const factory HomeState.exception(AppException appException) =
      HomeExceptionState;
}
