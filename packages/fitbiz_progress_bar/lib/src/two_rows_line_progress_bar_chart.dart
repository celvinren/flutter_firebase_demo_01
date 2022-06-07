import 'package:fitbiz_progress_bar/src/common_line_progress_bar_chart.dart';
import 'package:flutter/material.dart';

import 'theme_data.dart';

/// two rows title of progress bar
/// for revenues, orders, average and so on.
///
/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/revenue_progress_bar.png)
class FitbizTwoRowsLineProgressBarChart extends CommonLineProgressBarChart {
  final num value;
  final num target;
  final Color mainColor;
  final Color? backgroundColor;
  final String valueText;
  final String secondRowText;

  FitbizTwoRowsLineProgressBarChart({
    required this.value,
    required this.target,
    required this.mainColor,
    this.backgroundColor,
    required this.valueText,
    required this.secondRowText,
  }) : super(
            percentage: ((value.toDouble() == 0
                        ? 0
                        : value.toDouble() / target < 1
                            ? value.toDouble() / target
                            : 1) *
                    100)
                .floor());
  @override
  List<Widget> lineChartWidgetList() {
    return [getProgressBar(percentAfterPercentage: percentage, mainColor: mainColor, backgroundColor: backgroundColor)];
  }

  @override
  Widget textExplainPart() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getFirstRowValueText(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getSecondRowValueText(),
          ],
        ),
      ],
    );
  }

  @override
  Widget getFirstRowValueText() {
    return Text(
      valueText,
      overflow: TextOverflow.ellipsis,
      style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2!.copyWith(color: mainColor),
    );
  }

  @override
  Widget getSecondRowValueText() {
    return Text(
      secondRowText,
      overflow: TextOverflow.ellipsis,
      style: AppThemeData.summaryPageThemeData().textTheme.subtitle1!.copyWith(color: themeColors['default']!.selectAppsSubTitleText),
    );
  }
}
