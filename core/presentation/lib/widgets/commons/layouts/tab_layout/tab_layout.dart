import 'dart:async';
import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';

import 'fab_bottom_app_bar.dart';
export 'fab_bottom_app_bar.dart';

class TabLayout extends StatefulWidget {
  const TabLayout({
    super.key,
    this.screens = const [],
    this.items = const [],
    this.onWillPop,
    this.color,
    this.swipeable = true,
    this.appBarColor,
    this.headerVisible = true,
    this.centerButton,
    this.centerButtonText,
    this.bottomAppBarColor,
    this.onScaffoldInit,
    this.bottomAppBarActiveColor,
    this.darkMode = false,
    this.controller,
  }) : assert(items.length == screens.length);

  final TabController? controller;
  final bool swipeable;
  final Color? color;
  final Color? appBarColor;
  final Color? bottomAppBarColor;
  final Color? bottomAppBarActiveColor;
  final bool headerVisible;
  final List<FABBottomAppBarItem> items;
  final List<Widget> screens;
  final Widget? centerButton;
  final String? centerButtonText;
  final bool darkMode;
  final void Function(BuildContext scaffoldContext)? onScaffoldInit;

  @override
  _TabLayoutState createState() => _TabLayoutState();

  final Function()? onWillPop;
}

class _TabLayoutState extends State<TabLayout>
    with SingleTickerProviderStateMixin {
  final StreamController<int> _indexStream = StreamController();
  TabController? _tabController;

  bool get hasOwnController => widget.controller != null;

  @override
  void initState() {
    super.initState();
    _tabController = widget.controller ??
        TabController(vsync: this, length: widget.screens.length);
    _indexStream.add(0);

    _tabController!.addListener(onTabIndexUpdated);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (widget.onScaffoldInit != null) widget.onScaffoldInit(context);
    // });
  }

  onTabIndexUpdated() {
    _indexStream.add(_tabController!.index);
  }

  @override
  void dispose() {
    _indexStream.close();
    _tabController?.removeListener(onTabIndexUpdated);
    if (!hasOwnController) {
      _tabController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (widget.onScaffoldInit != null) {
            widget.onScaffoldInit!(context);
          }
          return SafeArea(
            top: false,
            child: TabBarView(
              controller: _tabController,
              children: widget.screens,
              physics: widget.swipeable
                  ? const PageScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _onTabSelected(int index) {
    _tabController!.animateTo(index);
  }

  Widget _buildBottomNavigationBar() {
    return StreamBuilder<int>(
        stream: _indexStream.stream,
        builder: (context, snapshot) {
          return FABBottomAppBar(
            index: snapshot.data ?? 0,
            centerItemText: widget.centerButtonText,
            color: AppColors.greyColor700,
            selectedColor: AppColors.primaryColor500,
            notchedShape: const CircularNotchedRectangle(),
            onTabSelected: (int? index) {
              if (_tabController!.index != index) _onTabSelected(index!);
            },
            items: widget.items,
          );
        });
  }
}
