import 'package:flutter/material.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/dialog/components/app_dialog_widget.dart';

import 'app_dialog_manager.dart';

class AlertDialogBuilder extends AppDialogBuilder {
  final VoidCallback? onCancel;
  final VoidCallback? onClose;
  final String? title;
  final String? message;
  final String? negativeText;
  final String? positiveText;
  final Widget? contentBuilder;

  AlertDialogBuilder(
      {this.onCancel,
      this.onClose,
      this.title,
      this.message,
      this.negativeText,
      this.positiveText,
      this.contentBuilder});

  @override
  Widget buildDialog(Key key) {
    return AppDialogWidget(
      animated: true,
      title: title,
      message: message,
      customWidget: contentBuilder,
      buttonDirection: DialogButtonDirection.HORIZONTAL,
      positiveButton: DialogButton(
          buttonText: positiveText ?? "OK",
          minWidth: AppDimensions.buttonMinimalWidth,
          onButtonClick: () {
            if (onClose != null) onClose!();
          }),
      onCloseButtonPress: () {
        if (onClose != null) onClose!();
      },
    );
  }
}
