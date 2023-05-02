import 'package:bloc/bloc.dart';
import 'package:data/entity/response/book_detail_response.dart';
import 'package:data/entity/response/event_detail_response.dart';
import 'package:equatable/equatable.dart';

part 'global_app_state.dart';

class GlobalAppCubit extends Cubit<GlobalAppState> {
  GlobalAppCubit() : super(GlobalAppState());

  void updateMockDataForBook(List<BookDetailResponse> newData) {
    emit(state.copyWith(bookData: newData));
  }

  void updateMockDataForEvent(List<EventDetailResponse> newData) {
    emit(state.copyWith(eventData: newData));
  }
}
