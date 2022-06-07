import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataAvailableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Text(
          "No data available",
          style: Theme.of(context).primaryTextTheme.headline5,
        ),
      ),
    );
  }
}
