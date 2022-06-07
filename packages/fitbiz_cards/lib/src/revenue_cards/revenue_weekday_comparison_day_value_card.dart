import 'package:expandable/expandable.dart';
import 'package:fitbiz_cards/fitbiz_cards.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_comparison_card.png)
class FitbizRevenueWeekdayComparisonDayValueCard extends FitbizRevenueMiddleTitleArrowCardHeader {
  FitbizRevenueWeekdayComparisonDayValueCard({
    Key? key,
    required String cardTitle,
    required Widget contentWidget,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          body: ExpandableNotifier(
            child: ScrollOnExpand(
                child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Text(
                        'Weekday',
                        style: AppThemeData.summaryPageThemeData()
                            .textTheme
                            .subtitle1!
                            .copyWith(color: themeColors['default']!.selectAppsSubTitleText, fontWeight: FontWeight.normal),
                      )),
                      Container(
                          child: Text(
                        '4 weeks\' average',
                        style: AppThemeData.summaryPageThemeData()
                            .textTheme
                            .subtitle1!
                            .copyWith(color: themeColors['default']!.selectAppsSubTitleText, fontWeight: FontWeight.normal),
                      )),
                    ],
                  ),
                ),
                contentWidget,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context)!;
                        return InkWell(
                          child: Container(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Text(
                              controller.expanded ? 'See less weekdays' : 'See more weekdays',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          onTap: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            )),
          ),
        );
}
