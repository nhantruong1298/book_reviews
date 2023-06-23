import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class MenuItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String? icon;
  final String? name;
  final MenuItemType type;
  const MenuItem({
    super.key,
    this.onTap,
    this.icon,
    this.name,
    this.type = const MenuButtonType(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultXSPadding,
      ),
      child: Material(
        color: AppColors.backgroundColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.defaultPadding,
                horizontal: AppDimensions.defaultXSPadding),
            child: Row(
              children: [
                SvgPicture.asset(AssetsGen.getRawString(icon ?? ''),
                    width: AppDimensions.defaultIconSizeSmall,
                    height: AppDimensions.defaultIconSizeSmall),
                const Spacing(1, direction: SpacingDirection.Horizontal),
                BodyLText(
                  name,
                  color: AppColors.textColor,
                  style: BodyLText.defaultStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.Playfair,
                  ),
                ),
                const Spacer(),
                trailing
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get trailing {
    if (type is MenuToggleType) {
      return Switch(
        value: (type as MenuToggleType).value,
        onChanged: (type as MenuToggleType).onChanged,
      );
    }
    return const SizedBox.shrink();
  }
}

abstract class MenuItemType {}

class MenuButtonType implements MenuItemType {
  const MenuButtonType();
}

class MenuToggleType implements MenuItemType {
  final bool value;
  final Function(bool value) onChanged;
  const MenuToggleType(this.value, this.onChanged);
}
