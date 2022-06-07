import 'package:flutter/material.dart';

class FitbizNavBarController {
  VoidCallback? hideNavBar;
  VoidCallback? showNavBar;

  void dispose() {
    hideNavBar = null;
    showNavBar = null;
  }
}
