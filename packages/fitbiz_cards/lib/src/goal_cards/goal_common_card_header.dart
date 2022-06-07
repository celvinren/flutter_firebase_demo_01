import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/revenue_total_card.gif)
class FitbizGoalCommonCardHeader extends CommonCard {
  FitbizGoalCommonCardHeader({
    Key? key,
    required String cardTitle,
    required List<Widget> bodyPageList,
    double? contentHeight,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          cartTitleIcon: SvgPicture.asset("assets/images/goals_icon.svg"),
          cardPrimaryColor: Color(0xff00D0CE),
          bodyPageList: bodyPageList,
          arrowTextPart: ArrowTextPart(isShowArrowText: true),
          introduction: null,
          learnMore: null,
          contentHeight: contentHeight,
          isShowArrow: isShowArrow ?? true,
          isShowDivider: false,
          introductionTextStyle: AppThemeData.summaryPageThemeData().primaryTextTheme.headline5!.copyWith(fontFamily: "Bariol"),
          learnMoreTextStyle: AppThemeData.summaryPageThemeData().textTheme.headline5!.copyWith(fontFamily: "Bariol"),
          cartTitleTextStyle:
              AppThemeData.summaryPageThemeData().textTheme.headline4!.copyWith(fontFamily: "Bariol", color: Color(0xff00D0CE)),
        );
}
