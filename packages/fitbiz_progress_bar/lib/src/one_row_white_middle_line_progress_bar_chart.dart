import 'package:fitbiz_progress_bar/src/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';

import 'one_row_line_progress_bar_chart.dart';

/// One row progress bar
/// with white color middle title
/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/order_top_5_products.png)
class FitbizOneRowWhiteMiddleLineProgressBarChart extends FitbizOneRowLineProgressBarChart {
  final num value;
  final num target;
  final Color mainColor;
  final Color? backgroundColor;
  final String valueText;
  final String? middleText;
  final Color? middleTextColor;
  final String? tailText;
  final String? tailBarChartNumberText;

  FitbizOneRowWhiteMiddleLineProgressBarChart({
    required this.value,
    required this.target,
    required this.mainColor,
    this.backgroundColor,
    required this.valueText,
    this.middleText,
    this.middleTextColor,
    this.tailText,
    this.tailBarChartNumberText,
  }) : super(
          value: value,
          target: target,
          mainColor: mainColor,
          backgroundColor: backgroundColor,
          valueText: valueText,
          middleText: middleText,
          tailText: tailText,
        );

  @override
  List<Widget> lineChartWidgetList() {
    return [
      getProgressBar(percentAfterPercentage: percentage, mainColor: mainColor, backgroundColor: backgroundColor),
      getProgressBarTailNumber(value: tailBarChartNumberText ?? ""),
    ];
  }

  @override
  Widget getFirstRowMiddleText() {
    return middleText != null
        ? Text(
            middleText!.toLowerCase().capitalize()!,
            overflow: TextOverflow.ellipsis,
            style: AppThemeData.summaryPageThemeData().textTheme.headline4!.copyWith(color: middleTextColor),
          )
        : Container();
  }
}
