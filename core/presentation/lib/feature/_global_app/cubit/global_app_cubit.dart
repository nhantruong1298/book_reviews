import 'package:bloc/bloc.dart';
import 'package:data/entity/response/book_detail_response.dart';
import 'package:equatable/equatable.dart';

part 'global_app_state.dart';

class GlobalAppCubit extends Cubit<GlobalAppState> {
  GlobalAppCubit() : super(GlobalAppState());

  void updateMockData(List<BookDetailResponse> newData) {
    emit(state.copyWith(mockData: newData));
  }
}
