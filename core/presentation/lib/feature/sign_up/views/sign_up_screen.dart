import 'package:flutter/material.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';
import 'package:presentation/widgets/input/text_input_field.dart';
import 'package:presentation/widgets/spacing.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseScreenState<SignUpScreen> {
  final String PHONE_FIELD = 'phone';
  final String PASSWORD_FIELD = 'password';

  @override
  Widget builder(BuildContext context) {
    return BasicLayout(
      automaticallyImplyLeading: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Heading1Text(
          "Đăng ký",
          color: AppColors.primaryColor500,
        ),
        const Spacing(2.5),
        TextInputField(
          name: PHONE_FIELD,
          labelText: "Số điện thoại",
        ),
        const Spacing(1.5),
        TextInputField(
          name: PASSWORD_FIELD,
          labelText: "Mật khẩu",
        ),
        const Spacing(1.5),
        const _SignInButton(),
        const Spacing(1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BodyLText(
              "Bạn đã có tài khoản?",
              color: AppColors.textGreyColor,
            ),
            TextButton(
                onPressed: () {},
                child: BodyLText(
                  "Đăng nhập",
                  color: AppColors.primaryColor500,
                ))
          ],
        )
      ]),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
        onTap: () {},
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
          child: BodyLText("Nhận mã xác nhận",
              color: AppColors.textLightColor,
              style: BodyLText.defaultStyle.copyWith(
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}
