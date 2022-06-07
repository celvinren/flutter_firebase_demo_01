import 'dart:ui';

import 'package:fitbiz_nav_bar/src/fitbiz_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fitbiz_navbar_item.dart';

typedef ItemBuilder = Widget Function(BuildContext context, int index, FitbizNavbarItem items, bool isShowNavBar);

class FitbizNavbar extends StatefulWidget {
  final List<FitbizNavbarItem> items;
  final int currentIndex;
  final void Function(int val)? onTap;
  final Color selectedBackgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color backgroundColor;
  final double fontSize;
  final double iconSize;
  final double itemBorderRadius;
  final double borderRadius;
  final ItemBuilder itemBuilder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;
  final double elevation;
  final double safeAreaHeight;
  final FitbizNavBarController? controller;

  FitbizNavbar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    ItemBuilder? itemBuilder,
    this.backgroundColor = Colors.black,
    this.selectedBackgroundColor = Colors.transparent,
    this.selectedItemColor = const Color(0xff007BFF),
    this.iconSize = 24.0,
    this.fontSize = 11.0,
    this.borderRadius = 8,
    this.itemBorderRadius = 8,
    this.unselectedItemColor = const Color(0xff9E9EA5),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.width = double.infinity,
    this.height = 90,
    this.safeAreaHeight = 0.0,
    this.elevation = 0.0,
    this.controller,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        assert(width > 50),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              borderRadius: borderRadius,
              fontSize: fontSize,
              width: width,
              backgroundColor: backgroundColor,
              currentIndex: currentIndex,
              iconSize: iconSize,
              itemBorderRadius: itemBorderRadius,
              items: items,
              onTap: onTap,
              selectedBackgroundColor: selectedBackgroundColor,
            ),
        super(key: key);

  @override
  _FloatingNavbarState createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FitbizNavbar> {
  List<FitbizNavbarItem> get items => widget.items;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.hideNavBar = hideNavBar;
      widget.controller!.showNavBar = showNavBar;
    }
  }

  hideNavBar() {
    setState(() {
      opacity = 0;
      begin = 1;
      end = 0;
      isShowNavBar = false;
    });
  }

  showNavBar() {
    setState(() {
      opacity = 1;
      begin = 0;
      end = 1;
      isShowNavBar = true;
    });
  }

  bool isShowNavBar = true;
  double opacity = 1;
  double begin = 0;
  double end = 1;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: widget.elevation,
        child: Center(
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: Tween<double>(begin: begin, end: end),
            builder: (BuildContext context, double value, Widget? child) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: opacity,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: (MediaQuery.of(context).size.height) - widget.height + 15.h - widget.safeAreaHeight,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: widget.height,

                      // Note: without ClipRect, the blur region will be expanded to full
                      // size of the Image instead of custom size
                      child: Container(
                        padding: widget.padding,
                        margin: widget.margin,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(widget.borderRadius),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              // margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(widget.borderRadius),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: items
                                    .asMap()
                                    .map((i, f) {
                                      return MapEntry(i, widget.itemBuilder(context, i, f, isShowNavBar));
                                    })
                                    .values
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val)? onTap,
  required List<FitbizNavbarItem> items,
  int? currentIndex,
  Color? selectedBackgroundColor,
  Color? selectedItemColor,
  Color? unselectedItemColor,
  Color? backgroundColor,
  double width = double.infinity,
  double? fontSize,
  double? iconSize,
  double? itemBorderRadius,
  double? borderRadius,
}) {
  return (BuildContext context, int index, FitbizNavbarItem item, bool isShowNavBar) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: currentIndex == index ? selectedBackgroundColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(itemBorderRadius!)),
              child: isShowNavBar != true
                  ? Container()
                  : InkWell(
                      onTap: () {
                        onTap!(index);
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: width.isFinite ? (width / items.length - 8) : MediaQuery.of(context).size.width / items.length - 24,
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: item.title != null ? 4 : 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            item.icon != null
                                ? Icon(
                                    item.icon,
                                    color: currentIndex == index ? selectedItemColor : unselectedItemColor,
                                    size: iconSize,
                                  )
                                : (currentIndex == index ? item.customWidgetActive! : item.customWidgetInactive!),
                            if (item.title != null)
                              Text(
                                '${item.title}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: currentIndex == index ? selectedItemColor : unselectedItemColor,
                                  fontSize: fontSize,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      );
}
