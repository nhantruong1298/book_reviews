import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  Future<void> sendEmailVerification() async {
    state.maybeWhen(
        firebase: (userCredential) async {
          await userCredential.user?.sendEmailVerification();
        },
        orElse: () {});
  }
}
