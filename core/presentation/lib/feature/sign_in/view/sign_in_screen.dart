import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/Spacing.dart';
import 'package:presentation/widgets/commons/inputs/password_field.dart';
import 'package:presentation/widgets/commons/inputs/text_input_field.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

part 'sign_in_listener.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseScreenState<SignInScreen> {
  final int MIN_LENGTH_PASSWORD = 8;
  final _formKey = GlobalKey<FormBuilderState>();
  String EMAIL_FIELD = 'email';
  String PASSWORD_FIELD = 'password';
  //bool? _isChecked = false;

  SignInCubit get signInCubit => BlocProvider.of<SignInCubit>(context);


  @override
  Widget builder(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: listener,
      child: BasicLayout(
        automaticallyImplyLeading: true,
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Heading1Text(
                "Đăng nhập",
                color: AppColors.primaryColor500,
                style: Heading1Text.defaultStyle
                    .copyWith(color: AppColors.primaryColor500),
              ),
              const Spacing(2),
              _buildEmailField(),
              const Spacing(1),
              _buildTextPasswordField(),
              const Spacing(2),
              // _buildCheckRBPW(),
              // const Spacing(3),
              _SignInButton(
                onTap: () {
                  _formKey.currentState!.validate();

                  if (_formKey.currentState?.isValid == true) {
                    final email = _formKey
                        .currentState?.fields[EMAIL_FIELD]?.value as String?;

                    final password = _formKey
                        .currentState?.fields[PASSWORD_FIELD]?.value as String?;

                    signInCubit.onSignIn(email ?? '', password ?? '');
                  }
                },
              ),
              // const Spacing(3),
              // Row(children: <Widget>[
              //   const Expanded(child: Divider()),
              //   BodyText(
              //     " Or, login with... ",
              //     style: BodyText.defaultStyle.copyWith(
              //       color: Color(0xff9A9B9C),
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              //   const Expanded(child: Divider()),
              // ]),
              const Spacing(3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BodyLText(
                    'Bạn chưa có tài khoản ? ',
                    color: Colors.black,
                  ),
                  TextButton(
                      onPressed: () {
                        SignUpRoute().go(context);
                      },
                      child: BodyLText(
                        'Đăng ký',
                        color: AppColors.primaryColor500,
                      ))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  // Widget _buildCheckRBPW() {
  //   return Container(
  //     height: 30,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //             height: 25,
  //             child: Theme(
  //               data: ThemeData(unselectedWidgetColor: Colors.grey // Your color
  //                   ),
  //               child: SizedBox(
  //                 height: 25,
  //                 child: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Transform.scale(
  //                       scale: 0.9,
  //                       child: Checkbox(
  //                           splashRadius: 2,
  //                           checkColor: Colors.white,
  //                           activeColor: AppColors.primaryColor500,
  //                           hoverColor: Colors.white,
  //                           value: _isChecked,
  //                           onChanged: (value) {}),
  //                     ),
  //                     const Text(
  //                       'Remember me',
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontWeight: FontWeight.w400,
  //                           fontSize: 18),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             )),
  //         Container(
  //           padding: const EdgeInsets.only(top: 4),
  //           height: 25,
  //           child: const ButtonText(
  //             "Forgot password?",
  //             style: TextStyle(
  //               color: Color(0xff457B9D),
  //               fontWeight: FontWeight.w400,
  //               fontSize: 18,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTextPasswordField() {
    return PasswordInputField(
      name: PASSWORD_FIELD,
      initialValue: '11111111',
      labelText: S.of(context).SIGN_UP__PASSWORD,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Không được để trống'),
        FormBuilderValidators.minLength(MIN_LENGTH_PASSWORD,
            errorText: S
                .of(context)
                .SIGN_UP__VALIDATION_PASSWORD_INVALID_MIN_LENGTH(
                    MIN_LENGTH_PASSWORD)),
      ]),
    );
  }

  Widget _buildEmailField() {
    return TextInputField(
      name: EMAIL_FIELD,
      labelText: S.current.SIGN_UP__EMAIL,
      initialValue: 'test13@yopmail.com',
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: S.current.SIGN_UP__CAN_NOT_BE_LEFT_BLANK),
        FormBuilderValidators.email(
            errorText: S.of(context).SIGN_UP__EMAIL_INVALID),
      ]),
    );
  }
}

class _SignInButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _SignInButton({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
        onTap: onTap,
        child: Container(
          height: AppDimensions.buttonHeight,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
              gradient: LinearGradient(colors: [
                const Color(0xFF1877F2),
                const Color(0xFF1877F2).withOpacity(.5)
              ])),
          child: BodyLText("Đăng nhập",
              color: AppColors.textLightColor,
              style: BodyLText.defaultStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}
