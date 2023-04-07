import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'confirm_otp_state.dart';

class ConfirmOtpCubit extends Cubit<ConfirmOtpState> {
  ConfirmOtpCubit() : super(ConfirmOtpInitial());
}
