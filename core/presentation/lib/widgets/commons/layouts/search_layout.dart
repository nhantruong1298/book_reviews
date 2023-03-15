import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_theme.dart';
import 'package:presentation/utils/debouncer.dart';

class SearchLayout extends StatefulWidget {
  final Widget? child;
  final String? searchHint;
  final EdgeInsets contentPadding;
  final TextEditingController? searchController;
  final List<Widget> filters;
  final Function(String value)? onSubmitted;
  final int debounceDuration;
  final Color? color;
  final Color? headerColor;
  final bool automaticallyImplyLeading;
  final FocusNode? focusNode;
  final Widget? headerLeading;
  final Widget Function(BuildContext scaffoldContext)? builder;
  final bool autoFocus;
  const SearchLayout(
      {super.key,
      this.child,
      this.searchHint,
      this.contentPadding = EdgeInsets.zero,
      this.searchController,
      this.onSubmitted,
      this.bottomNavigationBar,
      this.filters = const [],
      this.color,
      this.headerColor,
      this.automaticallyImplyLeading = false,
      this.debounceDuration = 300,
      this.focusNode,
      this.headerLeading,
      this.darkMode = false,
      this.builder,
      this.autoFocus = false});

  final Widget? bottomNavigationBar;

  final bool darkMode;

  @override
  _SearchLayoutState createState() => _SearchLayoutState();
}

class _SearchLayoutState extends State<SearchLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: widget.bottomNavigationBar,
      appBar: AppBar(
          leading: widget.headerLeading ?? getDefaultLeading(context),
          title: _SearchBar(
            autoFocus: widget.autoFocus,
            placeHolder:
                widget.searchHint ??"Search",
            controller: widget.searchController,
            onSubmitted: widget.onSubmitted,
            debounceDuration: widget.debounceDuration,
            focusNode: widget.focusNode,
          ),
          automaticallyImplyLeading: widget.automaticallyImplyLeading),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: widget.color ?? AppColors.backgroundGreyColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilters(),
            Expanded(
                child: Container(
                    padding: widget.contentPadding, child: _getBuildMethod())),
          ],
        ),
      ),
    );
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

  Widget _buildFilters() {
    if (widget.filters.isEmpty) {
      return Container();
    }

    return Container(
        height: 56,
        width: double.infinity,
        // padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: const Border(
              top: BorderSide(width: 1, color: AppColors.greyColor400)),
          color: widget.headerColor ?? AppColors.backgroundColor,
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  widget.filters.length,
                  (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: widget.filters[index])),
            )));
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
}

class _SearchBar extends StatefulWidget {
  final String? placeHolder;
  final TextEditingController? controller;
  final int? debounceDuration;
  final Function(String value)? onSubmitted;
  final FocusNode? focusNode;
  final bool autoFocus;
  const _SearchBar({
    Key? key,
    this.placeHolder,
    this.controller,
    this.debounceDuration,
    this.onSubmitted,
    this.focusNode,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  __SearchBarState createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(milliseconds: widget.debounceDuration);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: AppThemeStyle.searchHeaderDecoration
          .copyWith(hintText: widget.placeHolder),
      autofocus: widget.autoFocus,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onChanged: onSearchTextChanged,
      onSubmitted: onSearchTextChanged,
    );
  }

  void onSearchTextChanged(String value) {
    _debouncer.run(() {
      widget.onSubmitted!(value);
    });
  }
}
