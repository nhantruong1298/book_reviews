import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_constants.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class OTPInput extends StatelessWidget {
  final int? length;
  final Function(String otp)? onCompleted;
  final Function(String value)? onChanged;
  final TextInputType keyboardType;
  final bool hasError;

  final String? Function(String?)? validator;
  final BuildContext? appContext;
  final FocusNode? focusNode;
  final bool? autoFocus;

  const OTPInput({
    Key? key,
    this.appContext,
    this.length,
    this.onCompleted,
    this.onChanged,
    this.keyboardType = TextInputType.number,
    this.hasError = false,
    this.validator,
    this.focusNode,
    this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      focusNode: focusNode,
      validator: validator,
      appContext: context,
      pastedTextStyle:
          BodyText.defaultStyle.copyWith(fontWeight: FontWeight.bold),
      length: length!,
      obscureText: false,
      obscuringCharacter: '_',
      animationType: AnimationType.scale,
      animationDuration: AppConstants.animationDuration,
      pinTheme: PinTheme(
        activeColor: AppColors.primaryColor500,
        inactiveColor:
            AppColors.primaryColor500.withOpacity(AppColors.inactiveOpacity),
        selectedFillColor: AppColors.backgroundColor,
        inactiveFillColor: AppColors.backgroundColor,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        borderWidth: 1,
        fieldHeight: 56,
        fieldWidth: 42,
        activeFillColor:
            hasError ? AppColors.greyColor700 : Colors.white,
      ),
      showCursor: true,
      textStyle: BodyText.defaultStyle,
      backgroundColor: AppColors.backgroundColor,
      autoDismissKeyboard: true,
      autoFocus: autoFocus ?? true,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: (String otpCode) {
        if (onCompleted != null) onCompleted!(otpCode);
      },
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
      beforeTextPaste: (text) {
        // print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
