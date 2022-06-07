import 'package:fitbiz_cards/fitbiz_cards.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
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
        theme: AppThemeData.summaryPageThemeData(),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 30.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FitbizRevenueTotalCard(
                cardTitle: 'Sales',
                valueFirstPage: "\$1,711",
                valueSecondPage: "\$2,711",
                contentHeight: 40.h,
              ),
              FitbizRevenueComparisonDayValueCard(
                cardTitle: "Daily Sales Comparison",
                revenueCurrentValue: 5711,
                revenuePreviousValue: 6821,
                defaultCurrencySymbal: "\$",
              ),
              FitbizRevenuePartOfDayCard(
                cardTitle: "Parts of Day Drill Down ",
                contentHeight: 286.h,
                currentMidnightValue: "\$1,274.05",
                currentMorningValue: "\$1,274.05",
                currentAfternoonValue: "\$1,274.05",
                currentEveningValue: "\$1,274.05",
                previousMidnightValue: "\$1,274.05",
                previousMorningValue: "\$1,274.05",
                previousAfternoonValue: "\$1,274.05",
                previousEveningValue: "\$1,274.05",
              ),
              FitbizRevenueWeekdayComparisonDayValueCard(
                cardTitle: "Weekday Comparison",
                contentWidget: Container(),
              ),
              FitbizOrderTotalCard(
                cardTitle: 'Orders',
                valueFirstPage: "374",
                valueSecondPage: "111",
                subValueFirstPage: "Orders",
                subValueSecondPage: "Orders",
                contentHeight: 40.h,
              ),
              FitbizOrderComparisonCard(
                cardTitle: "Daily Orders Comparison",
                orderCurrentValue: 15,
                orderPreviousValue: 2,
              ),
              FitbizOrderMaxHourCard(
                  cardTitle: "Hottest Hour",
                  currentMaxOrderQuantities: 15,
                  previousMaxOrderQuantities: 5,
                  currentTtimeSlot: '12:00 pm - 1:00 pm',
                  previousTimeSlot: '12:00 pm - 1:00 pm',
                  contentHeight: 72.h),
              FitbizOrderTopFiveProductsCard(
                cardTitle: "Top 5 Products by Sales",
                topFiveProductsData: [
                  TopFiveProductsData(
                    currentValue: 128,
                    targetValue: 400,
                    yesterdayValue: 250,
                    productName: "Steak & Chips",
                  ),
                  TopFiveProductsData(
                    currentValue: 89,
                    targetValue: 100,
                    yesterdayValue: 146,
                    productName: "American burger",
                  ),
                  TopFiveProductsData(
                    currentValue: 57,
                    targetValue: 42,
                    yesterdayValue: 26,
                    productName: "Cesar salad",
                  ),
                  TopFiveProductsData(
                    currentValue: 43,
                    targetValue: 70,
                    yesterdayValue: 58,
                    productName: "Bacon and egg roll",
                  ),
                  TopFiveProductsData(
                    currentValue: 38,
                    targetValue: 80,
                    yesterdayValue: 70,
                    productName: "Fries",
                  ),
                ],
              ),
              FitbizGoalCard(
                cardTitle: "Your Goals",
                contentHeight: 190.h,
                currentRevenueValue: 70,
                currentOrderValue: 90,
                currentAverageValue: 65,
                currentRevenueTargetValue: 110,
                currentOrderTargetValue: 100,
                currentAverageTargetValue: 150,
                previousRevenueValue: 42,
                previousOrderValue: 15,
                previousAverageValue: 55,
                previousRevenueTargetValue: 60,
                previousOrderTargetValue: 30,
                previousAverageTargetValue: 150,
                defaultCurrencySymbal: "\$",
              ),
              FitbizTransactionTotalCard(
                cardTitle: 'AVG Transaction Value',
                valueFirstPage: "\$711",
                valueSecondPage: "\$475",
                subValueFirstPage: "Sales average",
                subValueSecondPage: "Sales average",
                contentHeight: 40.h,
              ),
              FitbizBusinessScoreTotalCard(
                cardTitle: 'Heartbeat (TVR)',
                minScore: "-79",
                maxScore: "+54",
              ),
              FitbizTransactionValueCard(
                cardTitle: 'Max Transaction',
                valueFirstPage: "\$57.18",
                valueSecondPage: "\$37.18",
                contentHeight: 40.h,
              ),
              FitbizTransactionAverageTimeCard(
                cardTitle: "Average Time",
                valueFirstPageHour: 0,
                valueFirstPageMins: 0,
                valueFirstPageSecs: 1,
                valueSecondPageHour: 0,
                valueSecondPageMins: 0,
                valueSecondPageSecs: 0,
                contentHeight: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
