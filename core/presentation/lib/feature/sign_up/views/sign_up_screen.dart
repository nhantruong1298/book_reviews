import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:presentation/feature/sign_up_success/views/sign_up_success_screen.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/inputs/password_field.dart';
import 'package:presentation/widgets/commons/inputs/text_input_field.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

part 'sign_up_listener.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseScreenState<SignUpScreen> {
  final int MIN_LENGTH_PASSWORD = 8;

  final String USER_NAME_FIELD = 'userName';
  final String PASSWORD_FIELD = 'password';
  final String RE_PASSWORD_FIELD = 're-password';
  final String SURNAME_FIELD = 'surname';
  final String NAME_FIELD = 'name';

  final _formKey = GlobalKey<FormBuilderState>();

  final passwordValue = ValueNotifier<String>('');

  @override
  void dispose() {
    passwordValue.dispose();
    super.dispose();
  }

  SignUpCubit get signUpCubit => context.read<SignUpCubit>();

  @override
  Widget builder(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: listener,
      child: BasicLayout(
        automaticallyImplyLeading: true,
        child: FormBuilder(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Heading1Text(
              "Đăng ký",
              color: AppColors.primaryColor500,
            ),
            const Spacing(2),
            _signUpWithEmailForm(),
            const Spacing(2),
            _SubmitButton(
              onTap: () {
                _formKey.currentState!.validate();

                if (_formKey.currentState?.isValid == true) {
                  final userName = _formKey
                      .currentState?.fields[USER_NAME_FIELD]?.value as String?;

                  final password = _formKey
                      .currentState?.fields[PASSWORD_FIELD]?.value as String?;

                  final surname = _formKey
                      .currentState?.fields[SURNAME_FIELD]?.value as String?;

                  final name = _formKey.currentState?.fields[NAME_FIELD]?.value
                      as String?;

                  signUpCubit.onSubmit(userName!, password!, surname!, name!);
                }
              },
            ),
            const Spacing(1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyLText("Bạn đã có tài khoản?",
                    color: AppColors.textGreyColor),
                TextButton(
                    onPressed: () => SignInRoute().go(context),
                    child: BodyLText("Đăng nhập",
                        color: AppColors.primaryColor500))
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget _signUpWithEmailForm() {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: TextInputField(
              name: SURNAME_FIELD,
              labelText: "Họ",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: S.current.SIGN_UP__CAN_NOT_BE_LEFT_BLANK),
              ]),
            ),
          ),
          const Spacing(1, direction: SpacingDirection.Horizontal),
          Expanded(
            child: TextInputField(
              name: NAME_FIELD,
              labelText: "Tên",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: S.current.SIGN_UP__CAN_NOT_BE_LEFT_BLANK),
              ]),
            ),
          ),
        ],
      ),
      const Spacing(1),
      TextInputField(
        name: USER_NAME_FIELD,
        labelText: S.current.SIGN_UP__EMAIL,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: S.current.SIGN_UP__CAN_NOT_BE_LEFT_BLANK),
          FormBuilderValidators.email(
              errorText: S.of(context).SIGN_UP__EMAIL_INVALID),
        ]),
      ),
      const Spacing(1),
      PasswordInputField(
        name: PASSWORD_FIELD,
        labelText: S.of(context).SIGN_UP__PASSWORD,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'Không được để trống'),
          FormBuilderValidators.minLength(MIN_LENGTH_PASSWORD,
              errorText: S
                  .of(context)
                  .SIGN_UP__VALIDATION_PASSWORD_INVALID_MIN_LENGTH(
                      MIN_LENGTH_PASSWORD)),
        ]),
        onChanged: (text) {
          passwordValue.value = text ?? '';
        },
      ),
      const Spacing(1),
      ValueListenableBuilder(
        valueListenable: passwordValue,
        builder: (_, password, __) {
          return PasswordInputField(
              name: RE_PASSWORD_FIELD,
              initialValue: '',
              labelText: S.current.SIGN_UP__RE_ENTER_PASSWORD,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Không được để trống'),
                FormBuilderValidators.equal(password,
                    errorText: S.current.SIGN_UP__PASSWORD_DOES_NOT_MATCH),
              ]));
        },
      ),
    ]);
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  const _SubmitButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: AppDimensions.buttonHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
              gradient: LinearGradient(colors: [
                const Color(0xFF1877F2),
                const Color(0xFF1877F2).withOpacity(.5)
              ])),
          child: BodyLText("Xác nhận",
              color: AppColors.textLightColor,
              style: BodyLText.defaultStyle.copyWith(
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}
