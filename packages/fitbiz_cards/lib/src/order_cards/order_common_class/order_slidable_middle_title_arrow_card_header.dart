import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_total_card.gif)
class FitbizOrderSlidableWithMiddleTitleArrowCardHeader extends CommonCard {
  FitbizOrderSlidableWithMiddleTitleArrowCardHeader(
      {Key? key, required String cardTitle, required List<Widget> bodyPageList, required double contentHeight, bool? isShowArrow})
      : super(
          key: key,
          cardTitle: cardTitle,
          cartTitleIcon: SvgPicture.asset("assets/images/order_icon.svg"),
          cardPrimaryColor: Color(0xffFD9F10),
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
              AppThemeData.summaryPageThemeData().textTheme.headline4!.copyWith(fontFamily: "Bariol", color: Color(0xffFD9F10)),
        );
}
