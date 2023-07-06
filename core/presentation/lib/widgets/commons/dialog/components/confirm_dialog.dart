import 'package:flutter/material.dart';
import 'package:presentation/resources/app_dimensions.dart';

import '../app_dialog_manager.dart';
import 'app_dialog_widget.dart';

class ConfirmDialogBuilder extends AppDialogBuilder {
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final String? title;
  final String? message;
  final Widget? contentBuilder;
  final String? negativeText;
  final String? positiveText;
  final double? buttonWidth;
  final double width;
  final double height;
  Widget? image;
  ConfirmDialogBuilder({
    this.onCancel,
    this.onConfirm,
    this.title,
    this.message,
    this.contentBuilder,
    this.negativeText,
    this.positiveText,
    this.buttonWidth,
    this.width = 300,
    this.height = 200,
    this.image,
  });

  @override
  Widget buildDialog(Key key) {
    return Container(
      constraints: BoxConstraints(minHeight: height, minWidth: width),
      child: AppDialogWidget(
        animated: true,
        title: title,
        icon: image,
        iconStyle: DialogIconStyle.INNER,
        message: message,
        customWidget: contentBuilder,
        buttonDirection: DialogButtonDirection.HORIZONTAL,
        negativeButton: DialogButton(
            buttonText: negativeText ?? "Cancel",
            minWidth: buttonWidth ?? AppDimensions.buttonMinimalWidth,
            onButtonClick: () {
              if (onCancel != null) onCancel!();
            }),
        positiveButton: DialogButton(
            buttonText: positiveText ?? "Confirm",
            minWidth: buttonWidth ?? AppDimensions.buttonMinimalWidth,
            onButtonClick: () {
              onConfirm!();
            }),

        onCloseButtonPress: () {
          // print('closed');
          onCancel!();
        },
        // isShowCloseButton: true,
        // customWidget: ,
      ),
    );
  }
}
