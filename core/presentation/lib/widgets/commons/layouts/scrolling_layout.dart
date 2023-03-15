import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';


class ScrollingLayout extends StatelessWidget {
  final Widget? header;
  final Color? color;
  final Widget? child;
  final Widget? bottomNavigationBar;
  final bool hasScaffold;

  const ScrollingLayout(
      {super.key,
      this.header,
      this.child,
      this.color,
      this.bottomNavigationBar,
      this.hasScaffold = true});

  @override
  Widget build(BuildContext context) {
    final layout = SafeArea(
      top: false,
      child: Container(
          color: color ?? AppColors.backgroundGreyColor,
          child: NestedScrollView(
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder: ((context, innerBoxIsScrolled) =>
                  header != null ? [header!] : []),
              body: child!)),
    );
    if (hasScaffold == true) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: color,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: bottomNavigationBar,
        body: layout,
      );
    }
    return layout;
  }
}
