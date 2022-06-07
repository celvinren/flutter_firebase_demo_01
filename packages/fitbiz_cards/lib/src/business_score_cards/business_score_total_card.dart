import 'package:fitbiz_cards/src/business_score_cards/business_score_total_common_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/business_score_card.png)
class FitbizBusinessScoreTotalCard extends FitbizBusinessScoreTotalCommonCardHeader {
  FitbizBusinessScoreTotalCard({
    Key? key,
    required String cardTitle,
    required String minScore,
    required String maxScore,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(
                    minScore,
                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    maxScore,
                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "TVR",
                    style: AppThemeData.summaryPageThemeData()
                        .textTheme
                        .subtitle1!
                        .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                  ),
                ],
              ),
            ],
          ),
        );
}
