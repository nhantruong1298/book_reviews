import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/sign_up_success/cubit/sign_up_success_cubit.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/button/button.dart';
import 'package:presentation/widgets/commons/button/button_type.dart';
import 'package:presentation/widgets/commons/count_down_timer.dart';
import 'package:presentation/widgets/commons/html_view.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:timer_count_down/timer_controller.dart';

part 'sign_up_success_listener.dart';

class SignUpSuccessParams {
  final String email;
  final String userId;
  SignUpSuccessParams(this.userId, this.email);
}

class SignUpSuccessScreen extends StatefulWidget {
  //final UserCredential userCredential;
  final SignUpSuccessParams extra;
  const SignUpSuccessScreen({
    super.key,
    required this.extra,
  });

  @override
  State<SignUpSuccessScreen> createState() => _SignUpSuccessScreenState();
}

class _SignUpSuccessScreenState extends BaseScreenState<SignUpSuccessScreen> {
  final CountdownController _countDownController =
      CountdownController(autoStart: true);
  final int _timerSeconds = 60;
  final ValueNotifier<bool> _resendButtonValue = ValueNotifier(true);
  final ValueNotifier<bool> _timerValue = ValueNotifier(false);

  SignUpSuccessCubit get cubit => context.read<SignUpSuccessCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //cubit.onScreenInit(widget.userCredential);
    });
  }

  @override
  Future<bool> onWillPop() {
    return Future.value(false);
  }

  @override
  void dispose() {
    _resendButtonValue.dispose();
    _timerValue.dispose();
    super.dispose();
  }

  @override
  Widget builder(BuildContext context) {
    final userName = widget.extra.email;
    return BlocListener<SignUpSuccessCubit, SignUpSuccessState>(
      listener: listener,
      child: BasicLayout(
        bottomNavigationBar: _buildButtonBack(),
        padding: const EdgeInsets.all(AppDimensions.defaultPadding),
        child: SizedBox(
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Lottie.asset(
              AssetsGen.getRawString(Assets.raws.successAnimation),
              repeat: false,
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.3,
            ),
            const Spacing(1.5),
            BodyXLText(
              S.current.SIGN_UP_SUCCESS__SIGN_UP_SUCCESS,
              style:
                  BodyXLText.defaultStyle.copyWith(fontWeight: FontWeight.w700),
            ),
            const Spacing(.5),
            _buildDescription(userName),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyMText(S.current.SIGN_UP___DID_NOT_GET_EMAIL,
                    color: AppColors.textGreyColor),
                _buildResendEmailButton(),
                _buildTimer()
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildDescription(String userName) {
    return HtmlView(
      data: S.current.SIGN_UP_SUCCESS_DESCRIPTION(userName),
      style: {
        'p': Style(color: AppColors.textGreyColor, textAlign: TextAlign.center),
        'span': Style(color: AppColors.primaryDarkColor)
      },
    );
  }

  Widget _buildButtonBack() {
    return Container(
      padding: AppDimensions.defaultBottomBarPadding,
      child: AppButton(
          onPressed: onButtonBackPressed,
          type: AppButtonType.Primary,
          block: true,
          text: S.current.SIGN_UP_SUCCESS__BACK_TO_SIGN_IN),
    );
  }

  Widget _buildResendEmailButton() {
    return ValueListenableBuilder<bool>(
        valueListenable: _resendButtonValue,
        builder: (_, value, child) {
          return TextButton(
              onPressed: value
                  ? () {
                      cubit.onResendPressed();
                    }
                  : null,
              child: BodyMText(
                S.current.SIGN_UP___RESEND,
                color: value ? AppColors.linkColor : AppColors.greyColor500,
              ));
        });
  }

  Widget _buildTimer() {
    return ValueListenableBuilder<bool>(
        valueListenable: _timerValue,
        builder: (_, value, __) {
          return Visibility(
            visible: value,
            key: UniqueKey(),
            child: CountdownTimer(
              seconds: _timerSeconds,
              controller: _countDownController,
              onFinished: () {
                _resendButtonValue.value = true;
                _countDownController.onStart =
                    () => _countDownController.restart();
              },
              textStyle:
                  BodyLText.defaultStyle.copyWith(fontWeight: FontWeight.w600),
            ),
          );
        });
  }
}
