import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_constants.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

class ValueItem<T> {
  final String text;
  final T value;

  ValueItem(this.text, this.value);
}

class _SelectionModal<T> extends StatelessWidget {
  final List<ValueItem<T>?>? items;
  final Function(T value)? onChanged;
  final T? value;
  final String? label;

  const _SelectionModal(
      {Key? key, this.items, this.onChanged, this.value, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: HeadingText(label ?? '')),
            ...List.generate(
                items!.length,
                (index) => ListTile(
                      title: Text(items![index]?.text ?? ''),
                      onTap: () {
                        final T value = items![index]!.value;
                        onChanged!(value);
                        Navigator.pop(context);
                      },
                      trailing: value == items![index]!.value
                          ? const Icon(
                              Icons.check,
                              color: AppColors.primaryColor500,
                            )
                          : null,
                    )),
          ],
        ),
      ),
    );
  }
}

class ChipInput<T> extends StatefulWidget {
  final T? value;
  final String? label;
  final List<ValueItem<T>?>? items;
  final Function(T value)? onChanged;

  const ChipInput(
      {Key? key, this.value, this.label, this.items, this.onChanged})
      : super(key: key);

  @override
  _ChipInputState<T> createState() => _ChipInputState<T>();
}

class _ChipInputState<T> extends State<ChipInput> {
  ValueItem<T?>? get selectedValueItem => widget.items!.firstWhereOrNull(
        (element) => element!.value == widget.value,
      ) as ValueItem<T?>?;

  _showDialogPicker() {
    return showBarModalBottomSheet(
        expand: false,
        context: context,
        enableDrag: true,
        duration: AppConstants.animationDuration,
        builder: (context) => _SelectionModal(
              items: widget.items,
              onChanged: widget.onChanged,
              value: widget.value,
              label: widget.label,
            ));
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.value != null;
    final backgroundColor =
        hasValue ? AppColors.primaryColor500 : AppColors.backgroundGreyColor;
    final textColor = hasValue ? AppColors.textLightColor : AppColors.textColor;
    return GestureDetector(
      onTap: _showDialogPicker,
      child: Container(
          height: SizeConfig.getProportionateScreenHeight(36),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              color: backgroundColor),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              _buildLabel(hasValue, textColor),
              const SizedBox(
                width: 4,
              ),
              _buildTrailingIcon(hasValue, textColor)
            ],
          )),
    );
  }

  Widget _buildLabel(bool hasValue, Color textColor) {
    return hasValue
        ? BodyMText(
            selectedValueItem?.text ?? '',
            color: textColor,
          )
        : BodyMText(widget.label);
  }

  Widget _buildTrailingIcon(bool hasValue, Color textColor) => hasValue
      ? GestureDetector(
          child: Icon(Icons.close, color: textColor),
          onTap: () {
            widget.onChanged!(null);
          },
        )
      : Icon(Icons.keyboard_arrow_down, color: textColor);
}
