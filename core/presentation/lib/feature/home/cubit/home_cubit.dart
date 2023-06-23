import 'package:bloc/bloc.dart';
import 'package:domain/model/book/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/feature/home/home_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(const HomeInitial());

  void onScreenInit() async {
    final trendingBooksResult = await _homeRepository.loadTrendingBooks();
    emit(HomeLoadedState(trendingBooksResult, []));
  }
}
