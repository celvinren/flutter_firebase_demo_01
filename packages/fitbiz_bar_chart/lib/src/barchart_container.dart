// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitbiz_bar_chart/src/theme_data.dart';
import 'package:fitbiz_bar_chart/src/y_axis_algorithm.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum DataValueType { DayValue, WeekValue, MonthValue }

class BarChartContainer extends StatefulWidget {
  final List<BarChartGroupData> data;
  final double barchartHeight;
  final double barWidth;
  final double barchartContentWidth;
  final String Function(double)? xAxisFunction;
  final YAxsiValue yAxsiValue;
  final bool isMoneyFormat;
  final double chartBottomTitleMarginBetweenLineAndtext;
  final double chartBottomTitleReserveSize;
  final String defaultCurrencySymbal;

  const BarChartContainer({
    Key? key,
    required this.data,
    required this.barchartHeight,
    required this.barWidth,
    required this.barchartContentWidth,
    required this.xAxisFunction,
    required this.yAxsiValue,
    required this.isMoneyFormat,
    this.chartBottomTitleMarginBetweenLineAndtext = 10,
    this.chartBottomTitleReserveSize = 15,
    required this.defaultCurrencySymbal,
  }) : super(key: key);

  @override
  State<BarChartContainer> createState() => _ProviderBreakdownBarChartState();
}

class _ProviderBreakdownBarChartState extends State<BarChartContainer> {
  final Color horizontalLineColor = const Color(0xff4E5052);

  final currencyFormat = NumberFormat.currency(customPattern: "#,##0.00");
  final Duration animation = const Duration(milliseconds: 250);
  ScrollController controller = ScrollController();
  double hPaddingProviderBD = 25;
  double yAxisWidthProviderBD = 50;
  double barWidth = 0;
  bool isInitBarChart = true;

  @override
  void initState() {
    super.initState();
    barWidth = (widget.barchartContentWidth / widget.data.length);
  }

  @override
  Widget build(BuildContext context) {
    int nonNullBarIndex = 0;
    for (int i = 0; i < widget.data.length; i++) {
      if (widget.data[i].barRods.last.y != 0) {
        nonNullBarIndex = i;
        break;
      }
    }

    List<num> valueList = [];
    for (int i = 0; i < widget.data.length; i++) {
      valueList.add(widget.data[i].barRods.last.y);
    }
    // YAxsiValue yAxsiValue = getYasxiNumber(valueList, widget.yAsxiSteps);

    if (isInitBarChart) {
      Timer(const Duration(milliseconds: 500), () {
        controller.animateTo(widget.barWidth * (nonNullBarIndex > 0 ? nonNullBarIndex - 1 : nonNullBarIndex),
            duration: const Duration(seconds: 2), curve: Curves.ease);
      });
      isInitBarChart = false;
    }

    return getBarchartWidget(
      context,
      controller,
      DataValueType.DayValue,
      widget.yAxsiValue,
      widget.data,
      animation,
      widget.barchartHeight,
      widget.barchartContentWidth,
      widget.xAxisFunction,
      widget.defaultCurrencySymbal,
    );
  }

  Widget getBarchartWidget(
    BuildContext context,
    ScrollController controller,
    DataValueType dataValueType,
    YAxsiValue yAxsiValue,
    List<BarChartGroupData>? data,
    Duration animation,
    double barchartHeight,
    double barchartContentWidth,
    String Function(double)? xAxisFunction,
    String defaultCurrencySymbal,
  ) {
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: barchartContentWidth,
        height: barchartHeight,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceEvenly,
            maxY: yAxsiValue.maxY + 0.00000000001,
            minY: 0,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.blueGrey,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String value = widget.isMoneyFormat == false
                      ? rod.y.toInt().toString()
                      : defaultCurrencySymbal + currencyFormat.format(rod.y);
                  return BarTooltipItem(
                      value, AppThemeData.summaryPageThemeData().textTheme.headline5!.copyWith(color: Colors.white));
                },
                fitInsideHorizontally: true,
                fitInsideVertically: true,
              ),
            ),
            titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (context, value) =>
                      AppThemeData.summaryPageThemeData().textTheme.headline2!.copyWith(fontWeight: FontWeight.normal),
                  rotateAngle: 0,
                  margin: widget.chartBottomTitleMarginBetweenLineAndtext,
                  reservedSize: widget.chartBottomTitleReserveSize,
                  getTitles: xAxisFunction,

                  // (double value) {
                  //   if (dataValueType == DataValueType.DayValue) {
                  //     switch (value.toInt()) {
                  //       case 0:
                  //         return '0 am';
                  //       case 2:
                  //         return '2 am';
                  //       case 4:
                  //         return '4 am';
                  //       case 6:
                  //         return '6 am';
                  //       case 8:
                  //         return '8 am';
                  //       case 10:
                  //         return '10 am';
                  //       case 12:
                  //         return '12 pm';
                  //       case 14:
                  //         return '2 pm';
                  //       case 16:
                  //         return '4 pm';
                  //       case 18:
                  //         return '6 pm';
                  //       case 20:
                  //         return '8 pm';
                  //       case 22:
                  //         return '10 pm';
                  //       default:
                  //         return '';
                  //     }
                  //   } else if (dataValueType == DataValueType.WeekValue) {
                  //     switch (value.toInt()) {
                  //       case 0:
                  //         return 'Mon';
                  //       case 1:
                  //         return 'Tue';
                  //       case 2:
                  //         return 'Wed';
                  //       case 3:
                  //         return 'Thu';
                  //       case 4:
                  //         return 'Fri';
                  //       case 5:
                  //         return 'Sat';
                  //       case 6:
                  //         return 'Sun';
                  //       default:
                  //         return '';
                  //     }
                  //   } else {
                  //     return (value + 1).toInt().toString();
                  //   }
                  // },
                ),
                leftTitles: SideTitles(reservedSize: 40, showTitles: false)),
            // groupsSpace: 12,
            gridData: FlGridData(
              show: true,
              horizontalInterval: yAxsiValue.interval.toDouble(),
              checkToShowHorizontalLine: (value) {
                // if (value == yAxsiValue.maxY || value == 0) {
                //   return true;
                // }
                return (value % yAxsiValue.interval) == 0;
              },
              getDrawingHorizontalLine: (value) {
                if (value == 0) {
                  return FlLine(
                    color: Colors.white, //Color(0xff363753),
                    strokeWidth: 3,
                  );
                }
                return FlLine(
                  color: horizontalLineColor,
                  dashArray: [3, 3],
                  strokeWidth: 0.8,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: data,
          ),
          swapAnimationDuration: animation,
        ),
      ),
    );
  }
}
