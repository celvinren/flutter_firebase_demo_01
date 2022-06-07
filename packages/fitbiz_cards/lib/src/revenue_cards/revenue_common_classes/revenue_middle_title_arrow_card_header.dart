import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/revenue_top_5_products.png)
class FitbizRevenueMiddleTitleArrowCardHeader extends CommonCard {
  FitbizRevenueMiddleTitleArrowCardHeader({
    Key? key,
    required String cardTitle,
    required Widget body,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          cartTitleIcon: SvgPicture.asset("assets/images/revenue_icon.svg"),
          cardPrimaryColor: Color(0xfffe5712),
          bodyPageList: [body],
          arrowTextPart: ArrowTextPart(isShowArrowText: true, arrowText: "Today"),
          introduction: null,
          learnMore: null,
          // contentHeight: 40.h,
          isShowArrow: isShowArrow ?? true,
          isShowDivider: false,
          introductionTextStyle: AppThemeData.summaryPageThemeData().primaryTextTheme.headline5!.copyWith(fontFamily: "Bariol"),
          learnMoreTextStyle: AppThemeData.summaryPageThemeData().textTheme.headline5!.copyWith(fontFamily: "Bariol"),
          cartTitleTextStyle:
              AppThemeData.summaryPageThemeData().textTheme.headline4!.copyWith(fontFamily: "Bariol", color: Color(0xfffe5712)),
        );
}
