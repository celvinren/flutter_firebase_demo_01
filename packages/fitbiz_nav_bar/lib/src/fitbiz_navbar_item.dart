import 'package:flutter/material.dart';

class FitbizNavbarItem {
  final String? title;
  final IconData? icon;
  final Widget? customWidgetActive;
  final Widget? customWidgetInactive;

  FitbizNavbarItem({
    this.icon,
    this.title,
    this.customWidgetActive,
    this.customWidgetInactive,
  }) : assert(icon != null || (customWidgetActive != null && customWidgetInactive != null));
}
