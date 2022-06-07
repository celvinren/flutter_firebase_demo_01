import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_comparison_card.png)
class FitbizOrderArrowCardHeader extends CommonCard {
  FitbizOrderArrowCardHeader({
    Key? key,
    required String cardTitle,
    required List<Widget> bodyPageList,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          cartTitleIcon: SvgPicture.asset("assets/images/order_icon.svg"),
          cardPrimaryColor: Color(0xffFD9F10),
          bodyPageList: bodyPageList,
          arrowTextPart: ArrowTextPart(isShowArrowText: false),
          introduction: null,
          learnMore: null,
          // contentHeight: 40.h,
          isShowArrow: isShowArrow ?? true,
          isShowDivider: false,
          introductionTextStyle: AppThemeData.summaryPageThemeData().primaryTextTheme.headline5!.copyWith(fontFamily: "Bariol"),
          learnMoreTextStyle: AppThemeData.summaryPageThemeData().textTheme.headline5!.copyWith(fontFamily: "Bariol"),
          cartTitleTextStyle:
              AppThemeData.summaryPageThemeData().textTheme.headline4!.copyWith(fontFamily: "Bariol", color: Color(0xffFD9F10)),
        );
}
