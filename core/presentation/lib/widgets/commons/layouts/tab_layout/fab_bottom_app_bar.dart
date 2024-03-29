import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_constants.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

import '../../Spacing.dart';

abstract class FABBottomAppBarItem {
  double get inActiveIconSize => 22;
  double get activeIconSize => 24;
  bool get disabled => false;

  Widget? icon;
  Widget? activeIcon;
  String? title;
}

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar({
    super.key,
    this.items = const [],
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    this.index = 0,
  }) : assert(items.length > 1);

  final int index;
  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int?>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  _updateIndex(int? index) {
    widget.onTabSelected!(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    if (widget.centerItemText != null) {
      items.insert(items.length >> 1, _buildMiddleTabItem());
    }
    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      elevation: 0.0,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    int? index,
    ValueChanged<int?>? onPressed,
  }) {
    final isSelected = widget.index == index;
    Color? titleColor = isSelected ? widget.selectedColor : widget.color;
    final currentIcon = isSelected ? item.activeIcon! : item.icon!;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: item.disabled || onPressed == null
                ? null
                : () => onPressed(index),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    left: 5,
                    right: 5,
                    child: AnimatedContainer(
                      duration: AppConstants.defaultDuration,
                      height: isSelected ? 4 : 0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor500,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          )),
                    )),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentIcon,
                    const Spacing(.1),
                    Flexible(
                      child: BodyXXSText(
                        item.title ?? '',
                        color: titleColor,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
