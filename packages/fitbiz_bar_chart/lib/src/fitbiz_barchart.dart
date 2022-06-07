import 'package:fitbiz_bar_chart/src/barchart_container.dart';
import 'package:fitbiz_bar_chart/src/y_axis_algorithm.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FitbizBarchart extends StatelessWidget {
  final double barchartHeight;
  final double barWidth;
  final double barchartContentWidth;
  final List<BarChartGroupData> data;
  final YAxsiValue yAxsiValue;
  final List<Widget> yAxisColumn;
  final Color backgroundColor;
  final bool isMoneyFormat;
  final String Function(double)? xAxisFunction;
  final String defaultCurrencySymbal;

  const FitbizBarchart({
    Key? key,
    required this.barchartHeight,
    required this.barWidth,
    required this.barchartContentWidth,
    required this.data,
    required this.yAxsiValue,
    required this.yAxisColumn,
    this.backgroundColor = Colors.black,
    this.isMoneyFormat = true,
    required this.xAxisFunction,
    required this.defaultCurrencySymbal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: BarChartContainer(
              data: data,
              barchartHeight: barchartHeight,
              barWidth: barWidth,
              barchartContentWidth: barchartContentWidth,
              isMoneyFormat: isMoneyFormat,
              yAxsiValue: yAxsiValue,
              xAxisFunction: xAxisFunction,
              defaultCurrencySymbal: defaultCurrencySymbal,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: barchartHeight - 25,
              maxHeight: barchartHeight - 25,
              // minWidth: yAsxiWidth,
              // maxWidth: yAsxiWidth,
            ),
            // width: yAsxiWidth,
            // color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: yAxisColumn,
            ),
          )
        ],
      ),
    );
  }
}
