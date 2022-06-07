import 'package:fitbiz_bar_chart/fitbiz_bar_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, widget) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double yAsxiWidth = 50.w;
    double barWidth = ((MediaQuery.of(context).size.width - yAsxiWidth) / 8);
    double barchartWidth = barWidth * 24;
    int yAxisStep = 3;

    List<BarChartGroupData> data = [];
    for (int i = 0; i < 24; i++) {
      List<BarChartRodStackItem> barChartRodsList = [];
      barChartRodsList.add(
        BarChartRodStackItem(
          0,
          i > 5 ? (i + 1) * 100 : 0,
          Colors.amber.shade900,
        ),
      );
      data.add(BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            y: i > 5 ? (i + 1) * 100 : 0,
            width: barWidth - 30.w,
            colors: [themeColors["default"]!.summaryPageCardBG],
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(2), topRight: Radius.circular(2)),
            rodStackItems: barChartRodsList,
          ),
        ],
      ));
    }

    List<num> valueList = [];
    for (int i = 0; i < data.length; i++) {
      valueList.add(data[i].barRods.last.y);
    }
    YAxsiValue yAxsiValue = getYasxiNumber(valueList, yAxisStep);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: FitbizBarchart(
          barchartHeight: 400,
          barchartContentWidth: barchartWidth,
          barWidth: barWidth,
          data: data,
          yAxsiValue: yAxsiValue,
          yAxisColumn: getYAxisColumn(yAxsiValue.interval.toInt(), yAxisStep),
          xAxisFunction: xAxisFunction,
          backgroundColor: Colors.black,
          defaultCurrencySymbal: "\$",
        ),
      ),
    );
  }

  String xAxisFunction(double value) {
    // if (dataValueType == DataValueType.DayValue) {
    switch (value.toInt()) {
      case 0:
        return '0 am';
      case 2:
        return '2 am';
      case 4:
        return '4 am';
      case 6:
        return '6 am';
      case 8:
        return '8 am';
      case 10:
        return '10 am';
      case 12:
        return '12 pm';
      case 14:
        return '2 pm';
      case 16:
        return '4 pm';
      case 18:
        return '6 pm';
      case 20:
        return '8 pm';
      case 22:
        return '10 pm';
      default:
        return '';
    }
    // }
    // else if (dataValueType == DataValueType.WeekValue) {
    // switch (value.toInt()) {
    //   case 0:
    //     return 'Mon';
    //   case 1:
    //     return 'Tue';
    //   case 2:
    //     return 'Wed';
    //   case 3:
    //     return 'Thu';
    //   case 4:
    //     return 'Fri';
    //   case 5:
    //     return 'Sat';
    //   case 6:
    //     return 'Sun';
    //   default:
    //     return '';
    // }
    // } else {
    //   return (value + 1).toInt().toString();
    // }
  }

  List<Widget> getYAxisColumn(int interval, int yAxisStep) {
    List<Widget> yAxisColumn = [
      Container(
        padding: EdgeInsets.only(left: 10.w),
        child: Transform.translate(
          offset: Offset(0, 7.h),
          child: Text(
            "0",
            style: AppThemeData.summaryPageThemeData().textTheme.headline2!.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ),
    ];
    for (int i = 1; i <= yAxisStep; i++) {
      yAxisColumn.insert(
          0,
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Transform.translate(
              offset: Offset(
                  0,
                  i == 1
                      ? 3.5.h
                      : i == 2
                          ? -2.h
                          : -7.h),
              child: Text(
                (i * interval).toString(),
                style: AppThemeData.summaryPageThemeData().textTheme.headline2!.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ));
    }
    return yAxisColumn;
  }
}
