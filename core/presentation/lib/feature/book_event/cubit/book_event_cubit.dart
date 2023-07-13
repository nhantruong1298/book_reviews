import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_event_state.dart';

class BookEventCubit extends Cubit<BookEventState> {
  BookEventCubit() : super(BookEventInitial());
}
