import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_theme.dart';

import './types.dart';

class PasswordInputField extends StatefulWidget {
  final bool readOnly;
  final String name;
  final String labelText;
  final String? initialValue;
  final TextInputAction textInputAction;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<String> autofillHints;
  final FormValidator<String>? validator;
  final Function(String? value)? onChanged;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;

  const PasswordInputField({
    Key? key,
    required this.name,
    this.labelText = '',
    this.readOnly = false,
    this.initialValue,
    this.textInputAction = TextInputAction.done,
    this.autofillHints = const [AutofillHints.password],
    this.hintText,
    this.hintStyle,
    this.validator,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.focusNode,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  late FocusNode _focusNode;

  bool _hasFocus = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(onFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(onFocus);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget assetIcon = isPasswordVisible
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    return FormBuilderTextField(
        name: widget.name,
        enabled: !widget.readOnly,
        validator: widget.validator,
        initialValue: widget.initialValue,
        autovalidateMode: widget.autovalidateMode,
        onChanged: widget.onChanged,
        obscureText: !isPasswordVisible,
        focusNode: widget.focusNode,
        decoration: AppThemeStyle.inputDecoration(
          suffixIcon: IconButton(
            icon: assetIcon,
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
          hintText: widget.hintText,
          label: _buildLabel(_hasFocus),
        ));
  }

  Widget _buildLabel(bool hasFocus) {
    return Row(
      children: [
        Text('${widget.labelText} ', style: _getLabelStyle(hasFocus)),
      ],
    );
  }

  TextStyle _getLabelStyle(bool hasFocus) {
    return TextStyle(
      color: hasFocus ? AppColors.primaryColor500 : AppColors.textGreyColor,
    );
  }

  void onFocus() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }
}
