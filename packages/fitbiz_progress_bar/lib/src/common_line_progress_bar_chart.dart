import 'package:fitbiz_progress_bar/src/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CommonLineProgressBarChart extends StatelessWidget {
  final int percentage;
  CommonLineProgressBarChart({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textExplainPart(),
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Stack(
              alignment: Alignment.center,
              children: lineChartWidgetList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> lineChartWidgetList();
  Widget textExplainPart();

  Widget getProgressBar({required int percentAfterPercentage, required Color mainColor, Color? backgroundColor}) {
    return FAProgressBar(
      currentValue: percentAfterPercentage == 0 ? 1 : percentAfterPercentage,
      direction: Axis.horizontal,
      backgroundColor: backgroundColor ?? Colors.transparent,
      progressColor: mainColor,
      size: 25,
      borderRadius: BorderRadius.circular(5),
    );
  }

  Widget getProgressBarTailNumber({required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppThemeData.summaryPageThemeData().primaryTextTheme.caption,
            )),
      ],
    );
  }

  Widget textExplainPartRow({
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.baseline,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: Row(
            crossAxisAlignment: crossAxisAlignment,
            textBaseline: TextBaseline.ideographic,
            children: [
              //Value
              getFirstRowValueText(),
              SizedBox(width: 10.w),
              Expanded(flex: 3, child: getFirstRowMiddleText()),
            ],
            // ),
          ),
        ),
        SizedBox(width: 10.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            getFirstRowTailText(),
          ],
        ),
      ],
    );
  }

  Widget getFirstRowValueText() {
    return Container();
  }

  Widget getFirstRowMiddleText() {
    return Container();
  }

  Widget getFirstRowTailText() {
    return Container();
  }

  Widget getSecondRowValueText() {
    return Container();
  }

  Widget getSecondRowMiddleText() {
    return Container();
  }

  Widget getSecondRowTailText() {
    return Container();
  }
}
