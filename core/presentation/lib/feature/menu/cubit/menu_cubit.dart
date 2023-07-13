import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final AuthenticationCubit _authenticationCubit;
  MenuCubit(this._authenticationCubit) : super(MenuInitial());

  void onSignOutButtonPressed() {
    _authenticationCubit.onSignOut();
  }
}
