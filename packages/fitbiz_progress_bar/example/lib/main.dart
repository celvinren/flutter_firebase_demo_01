import 'package:flutter/material.dart';
import 'package:fitbiz_progress_bar/fitbiz_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FitbizTwoRowsLineProgressBarChart(
                mainColor: Color(0xffFE5712),
                backgroundColor: Colors.grey[600],
                secondRowText: 'Revenues',
                target: 10000,
                value: 5711,
                valueText: '\$5,711/\$10,000',
              ),
              // SizedBox(width: 20.h),
              // FitbizOneRowLineProgressBarChart(
              //   mainColor: Color(0xffFE5712),
              //   value: 58,
              //   target: 80,
              //   valueText: '\$58',
              //   middleText: "Sales",
              //   tailText: "Today",
              // ),
              // SizedBox(width: 20.h),
              // FitbizOneRowWhiteMiddleLineProgressBarChart(
              //   mainColor: Color(0xffFD9F10),
              //   value: 15,
              //   target: 30,
              //   valueText: '15',
              //   middleText: "Hamburger",
              //   middleTextColor: Colors.white,
              //   tailText: "Yesterday",
              //   tailBarChartNumberText: "25",
              //   backgroundColor: themeColors['default']!.summaryPageGoalCardProgressInactiveColor,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
