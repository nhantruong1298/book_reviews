import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'global_app_state.dart';

class GlobalAppCubit extends Cubit<GlobalAppState> {
  GlobalAppCubit() : super(const GlobalAppState());
}
