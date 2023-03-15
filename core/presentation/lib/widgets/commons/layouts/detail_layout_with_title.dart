import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class DetailLayoutWithTitle extends StatefulWidget {
  final String titleString;
  final Widget? child;
  final Widget Function(BuildContext scaffoldContext)? builder;
  final String? subtitle;
  const DetailLayoutWithTitle(
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
    this.subtitle,
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
  _DetailLayoutWithTitleState createState() => _DetailLayoutWithTitleState();
}

class _DetailLayoutWithTitleState extends State<DetailLayoutWithTitle>
    with SingleTickerProviderStateMixin {
  double topPadding = 0;

  GlobalKey? scaffoldKey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final top = MediaQuery.of(context).padding.top;
      setState(() {
        topPadding = top;
      });
    });
  }

  Widget? getDefaultLeading(BuildContext context) {
    if (widget.automaticallyImplyLeading == true) {
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      final bool canPop = parentRoute?.canPop ?? false;

      if (canPop) {
        return IconButton(
          icon: const Icon(
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
      centerTitle: widget.centerTitle,
      title: widget.subtitle != null
          ? Column(
              children: [
                BodyLText.bold(
                  widget.titleString,
                ),
                BodyLText.light(
                  widget.subtitle,
                  color: AppColors.textGreyColor,
                )
              ],
            )
          : BodyLText.bold(widget.titleString),
    );

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      backgroundColor: widget.color,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: widget.bottomNavigationBar,
      appBar: header,
      body: Container(
          padding: EdgeInsets.zero,
          color: widget.color,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    padding: widget.padding, child: _getBuildMethod()),
              ),
            ],
          )),
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
