import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/debouncer.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

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
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leadingWidth: 0,
          elevation: 0.0,
          title: SearchBarView(
            autoFocus: widget.autoFocus,
            placeHolder: widget.searchHint ?? "Tìm kiếm",
            controller: widget.searchController,
            onSubmitted: widget.onSubmitted,
            debounceDuration: widget.debounceDuration,
            focusNode: widget.focusNode,
          ),
          actions: [_buildBackButton()],
          automaticallyImplyLeading: widget.automaticallyImplyLeading),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(AppDimensions.defaultPadding),
        color: widget.color ?? AppColors.backgroundColor,
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

  Widget _buildBackButton() {
    return InkWell(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: AppDimensions.defaultPadding),
        child: BodyLText('Hủy'),
      ),
    );
  }
}

class SearchBarView extends StatefulWidget {
  final String? placeHolder;
  final TextEditingController? controller;
  final int? debounceDuration;
  final Function(String value)? onSubmitted;
  final FocusNode? focusNode;
  final bool autoFocus;
  const SearchBarView({
    Key? key,
    this.placeHolder,
    this.controller,
    this.debounceDuration,
    this.onSubmitted,
    this.focusNode,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  _SearchBarViewState createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(milliseconds: widget.debounceDuration);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.buttonHeight,
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.bottom,
        style: const TextStyle(
          color: AppColors.greyColor900,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.greyColor600,
          ),
          hintText: widget.placeHolder,
          filled: true,
          fillColor: const Color(0xffF6F6F6),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColor600),
            borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColor600),
            borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
          ),
        ),
        autofocus: widget.autoFocus,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onChanged: onSearchTextChanged,
        onSubmitted: onSearchTextChanged,
      ),
    );
  }

  void onSearchTextChanged(String value) {
    _debouncer.run(() {
      widget.onSubmitted!(value);
    });
  }
}
