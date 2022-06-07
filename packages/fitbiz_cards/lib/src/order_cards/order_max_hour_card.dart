import 'package:fitbiz_cards/src/order_cards/order_common_class/order_slidable_middle_title_arrow_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_total_card.gif)
class FitbizOrderMaxHourCard extends FitbizOrderSlidableWithMiddleTitleArrowCardHeader {
  FitbizOrderMaxHourCard({
    Key? key,
    required String cardTitle,
    required int? currentMaxOrderQuantities,
    required int? previousMaxOrderQuantities,
    required String currentTtimeSlot,
    required String previousTimeSlot,
    double? contentHeight,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          contentHeight: contentHeight ?? 74.h,
          bodyPageList: [
            currentMaxOrderQuantities != null && currentMaxOrderQuantities != 0
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Max Orders',
                                style: AppThemeData.summaryPageThemeData()
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Time Slot',
                                style: AppThemeData.summaryPageThemeData()
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Container(
                                  width: 100,
                                  child: Text(
                                    currentMaxOrderQuantities.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  )),
                              Container(
                                  child: Text(
                                currentTtimeSlot,
                                style: AppThemeData.summaryPageThemeData()
                                    .textTheme
                                    .caption!
                                    .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : NoDataAvailableWidget(),
            previousMaxOrderQuantities != null && previousMaxOrderQuantities != 0
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 90,
                              child: Text(
                                'Max Orders',
                                style: AppThemeData.summaryPageThemeData()
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Time Slot',
                                style: AppThemeData.summaryPageThemeData()
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Container(
                                  width: 90,
                                  child: Text(
                                    previousMaxOrderQuantities.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  )),
                              Container(
                                  child: Text(
                                previousTimeSlot,
                                style: AppThemeData.summaryPageThemeData()
                                    .textTheme
                                    .caption!
                                    .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : NoDataAvailableWidget()
          ],
        );
}

// class OrderHotestHour {
//   final int maxOrderQuantities;
//   final int maxOrderHour;

//   OrderHotestHour({required this.maxOrderQuantities, required this.maxOrderHour});
// }
