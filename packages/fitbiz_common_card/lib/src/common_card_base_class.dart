import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class CommonCardBaseClass extends StatefulWidget {
  final String cardTitle;
  final Widget cartTitleIcon;
  final List<Widget> bodyPageList;
  final bool isShowArrow;
  final ArrowTextPart? arrowTextPart;
  final Color? cardBackgroundColor;
  final Color? cardPrimaryColor;
  final double? contentHeight;
  final String? introduction; //no need
  final LearnMore? learnMore; //no need
  final bool isShowDivider; //no need
  final TextStyle? introductionTextStyle; //no need
  final TextStyle? learnMoreTextStyle; //no need
  final TextStyle? cartTitleTextStyle;

  CommonCardBaseClass({
    Key? key,
    required this.cardTitle,
    required this.cartTitleIcon,
    required this.cardPrimaryColor,
    required this.bodyPageList,
    this.arrowTextPart,
    this.introduction,
    this.learnMore,
    this.contentHeight = 100,
    this.isShowArrow = false,
    this.isShowDivider = false,
    this.cardBackgroundColor = const Color(0xff1d1b1d),
    this.cartTitleTextStyle,
    this.introductionTextStyle,
    this.learnMoreTextStyle,
  });
}

class LearnMore {
  final String title;
  final String webViewTitle;
  final String url;
  final BuildContext context;
  final Function? learnMoreFunction;

  LearnMore({
    required this.title,
    required this.webViewTitle,
    required this.url,
    required this.context,
    required this.learnMoreFunction,
  });
}

class ArrowTextPart {
  final bool isShowArrowText;
  final String? arrowText;

  ArrowTextPart({
    required this.isShowArrowText,
    this.arrowText,
  });
}
