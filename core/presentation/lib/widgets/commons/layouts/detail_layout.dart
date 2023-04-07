import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

class DetailLayout extends StatefulWidget {
  final String titleString;
  final Widget? child;
  final Widget Function(BuildContext scaffoldContext)? builder;
  const DetailLayout(
    this.titleString, {
    super.key,
    this.headerBottom,
    this.safeTopPadding,
    this.appBar,
    this.automaticallyImplyLeading,
    this.bottomNavigationBar,
    this.color,
    this.appBarColor,
    this.headerActions,
    this.headerLeading,
    this.headerVisible,
    this.padding,
    this.title,
    this.centerTitle,
    this.darkMode = false,
    this.child,
    this.builder,
  });

  final Widget? headerBottom;
  final bool? safeTopPadding;
  final Widget? appBar;
  final bool? automaticallyImplyLeading;
  final Widget? bottomNavigationBar;
  final Color? color;
  final Color? appBarColor;

  final List<Widget>? headerActions;
  final Widget? headerLeading;
  final bool? headerVisible;
  final EdgeInsets? padding;
  final Widget? title;
  final bool? centerTitle;

  final bool darkMode;

  @override
  _DetailLayoutState createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout>
    with SingleTickerProviderStateMixin {
  GlobalKey? scaffoldKey;

  Widget _buildAppBar() {
    final textStyleAnimation = Heading2Text.defaultStyle
        .copyWith(color: AppColors.primaryColor500);
    const alignmentAnimation = Alignment.bottomLeft;

    List<Widget> children = [
      Container(
        width: double.infinity,
        color: getAppBarColor(),
        alignment: alignmentAnimation,
        child: Text(
          widget.titleString,
          style: textStyleAnimation,
        ),
      )
    ];
    if (widget.headerBottom != null) {
      children.add(widget.headerBottom!);
    }
    children.add(const Spacing(.6));
    return Container(
      width: double.infinity,
      color: getAppBarColor(),
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimensions.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget? getDefaultLeading(BuildContext context) {
    if (widget.automaticallyImplyLeading == true) {
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      final bool canPop = parentRoute?.canPop ?? false;

      if (canPop) {
        return IconButton(
          icon:  const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            Navigator.of(context).pop();
          },
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final header = AppBar(
      backgroundColor: getAppBarColor(),
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? false,
      leading: widget.headerLeading ?? getDefaultLeading(context),
      actions: widget.headerActions,
    );

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: widget.color ?? AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: widget.bottomNavigationBar,
      appBar: header,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.zero,
            color: widget.color,
            child: Column(children: [
              _buildAppBar(),
              Expanded(
                  child: Container(
                      padding: widget.padding, child: _getBuildMethod())),
              // widget.bottomNavigationBar ?? Container(),
            ])),
      ),
    );
  }

  Color getAppBarColor() {
    return widget.appBarColor ?? AppColors.backgroundColor;
  }

  Widget _getBuildMethod() {
    return Builder(
      builder: (builderContext) {
        return widget.builder?.call(builderContext) ??
            widget.child ??
            Container();
      },
    );
  }
}
