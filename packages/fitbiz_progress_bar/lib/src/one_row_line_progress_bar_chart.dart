import 'package:fitbiz_progress_bar/src/common_line_progress_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:string_extensions/string_extensions.dart';

import 'theme_data.dart';

/// one row text on top of progress bar
/// for revenues, orders, average and so on.
///
/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/revenue_progress_bar.png)
class FitbizOneRowLineProgressBarChart extends CommonLineProgressBarChart {
  final num value;
  final num target;
  final Color mainColor;
  final Color? backgroundColor;
  final String valueText;
  final String? middleText;
  final String? tailText;

  FitbizOneRowLineProgressBarChart({
    required this.value,
    required this.target,
    required this.mainColor,
    this.backgroundColor,
    required this.valueText,
    this.middleText,
    this.tailText,
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
    return textExplainPartRow();
  }

  @override
  Widget getFirstRowValueText() {
    return Text(
      valueText,
      overflow: TextOverflow.ellipsis,
      style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
    );
  }

  @override
  Widget getFirstRowMiddleText() {
    return middleText != null
        ? Text(
            middleText!.toLowerCase().capitalize()!,
            overflow: TextOverflow.ellipsis,
            style: AppThemeData.summaryPageThemeData().textTheme.subtitle1!.copyWith(color: themeColors['default']!.selectAppsSubTitleText),
          )
        : Container();
  }

  @override
  Widget getFirstRowTailText() {
    return tailText != null
        ? Text(
            tailText!.toLowerCase().capitalize()!,
            overflow: TextOverflow.ellipsis,
            style: AppThemeData.summaryPageThemeData()
                .textTheme
                .subtitle1!
                .copyWith(color: themeColors['default']!.selectAppsSubTitleText, fontWeight: FontWeight.normal),
          )
        : Container();
  }
}
