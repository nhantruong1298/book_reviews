import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/widgets/commons/inputs/otp_input.dart';
import 'package:presentation/widgets/commons/inputs/types.dart';


class OTPTextField extends StatelessWidget {
  final int length;
  final String name;
  final Function(String otp)? onCompleted;
  final Function(String value)? onChanged;
  final TextInputType keyboardType;
  final BuildContext appContext;
  final FormValidator? validator;

  const OTPTextField({
    Key? key,
    required this.length,
    required this.name,
    this.onCompleted,
    this.onChanged,
    required this.keyboardType,
    required this.appContext,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      validator: validator,
      builder: (field) {
        final hasError = field.errorText != null;

        return OTPInput(
          appContext: appContext,
          hasError: hasError,
          onCompleted: (value) => field.didChange(value),
          onChanged: (value) => field.didChange(value),
          keyboardType: keyboardType,
          length: length,
          validator: null,
        );
      },
    );
  }
}
