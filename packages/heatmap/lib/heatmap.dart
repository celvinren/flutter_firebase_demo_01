library heatmap;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_style_sheet.dart' as a;

class Heatmap extends StatefulWidget {
  final Map<String, List<num?>> data;
  final Color? startColorRGBO;
  final Color? endColorRGBO;
  final int? colorRangeSteps;
  final List<String> xTitle;
  final List<String> yTitle;
  final Color titleTextColor;
  final double min;
  final double max;
  final List<Color?>? colorList;
  Heatmap({
    required this.data,
    this.startColorRGBO,
    this.endColorRGBO,
    this.colorRangeSteps,
    required this.xTitle,
    required this.yTitle,
    required this.titleTextColor,
    required this.min,
    required this.max,
    this.colorList,
  });
  @override
  _HeatmapState createState() => _HeatmapState();
}

class _HeatmapState extends State<Heatmap> {
  Color rowColor1 = Color.fromRGBO(174, 174, 174, 1);
  Color rowColor2 = Color.fromRGBO(186, 186, 186, 1);
  Color? oddRow;

  List<Color?>? colorList = [];
  int? colorRangeSteps;

  void generateColorList() {
    colorList!.add(widget.startColorRGBO);
    for (int i = 1; i < colorRangeSteps!; i++) {
      int red = (widget.startColorRGBO!.red + (widget.endColorRGBO!.red - widget.startColorRGBO!.red) * i / (colorRangeSteps! - 1)).round();
      int green =
          (widget.startColorRGBO!.green + (widget.endColorRGBO!.green - widget.startColorRGBO!.green) * i / (colorRangeSteps! - 1)).round();
      int blue =
          (widget.startColorRGBO!.blue + (widget.endColorRGBO!.blue - widget.startColorRGBO!.blue) * i / (widget.colorRangeSteps! - 1))
              .round();
      colorList!.add(Color.fromRGBO(red, green, blue, 1));
    }
  }

  int searchRange(num num) {
    double gap = widget.max / colorRangeSteps!;
    List<double> rangeList = List.generate(colorRangeSteps!, (index) => gap * index);
    for (int i = 0; i < rangeList.length; i++) {
      if (num >= rangeList[rangeList.length - 1]) {
        return (rangeList.length - 1);
      }
      if (num >= rangeList[i] && num < rangeList[i + 1]) {
        return i;
      }
    }
    return 0;
  }

  List<Widget> generateColumnList() {
    List<Widget> columnList = [];

    double gridHeight = (896 * 0.75 / 24).h;
    double gridWidth =
        ((MediaQuery.of(context).size.width - a.APPStyleSheet.pageHorizontalMargin.w * 2 - a.APPStyleSheet.cardHorizontalPadding.w * 2) /
            (widget.data.keys.length + 1));
    gridHeight = gridHeight > 20 ? gridHeight : 15;
    ////////////////
    List<Widget> yTitleContainers = [];
    yTitleContainers.add(Container(
      height: gridHeight,
      width: gridWidth,
    ));
    for (int i = 0; i < widget.yTitle.length; i++) {
      yTitleContainers.add(
        GridContainer(
          gridHeight: gridHeight,
          gridWidth: gridWidth,
          value: widget.yTitle[i],
          textColor: widget.titleTextColor,
          isShowValue: true,
          isShowBorder: false,
        ),
      );
    }
    Column yTitle = Column(
      children: yTitleContainers,
    );
    columnList.add(yTitle);
    ///////////////////////
    for (int i = 0; i < widget.data.keys.length; i++) {
      List<Widget> containerList = [];
      for (int j = 0; j < widget.data[widget.data.keys.elementAt(i)]!.length; j++) {
        Color? rowEmptyColor;

        //empty number
        if (widget.data[widget.data.keys.elementAt(i)]![j] == null) {
          if (i % 2 == 0 && j % 2 == 0) {
            rowEmptyColor = rowColor1;
          } else if (i % 2 == 1 && j % 2 == 1) {
            rowEmptyColor = rowColor1;
          } else {
            rowEmptyColor = rowColor2;
          }
        }
        if (widget.data[widget.data.keys.elementAt(i)]![j] != 0) {
          // print((widget.data[i][j][0] * 10 / widget.max).toString());
          // print((widget.data[i][j][0] * 10 / widget.max).round().toString());
          // print((widget.data[widget.data.keys.elementAt(i)][j]).round().toString());
          // print(searchRange(widget.data[widget.data.keys.elementAt(i)][j]));
        }
        containerList.add(
          GridContainer(
            gridHeight: gridHeight,
            gridWidth: gridWidth,
            value: widget.data[widget.data.keys.elementAt(i)]![j].toString(),
            // textColor: widget.titleTextColor,
            bgColor: widget.data[widget.data.keys.elementAt(i)]![j] == null
                ? rowEmptyColor
                : widget.data[widget.data.keys.elementAt(i)]![j] == 0
                    ? colorList![0]
                    : colorList![searchRange(widget.data[widget.data.keys.elementAt(i)]![j]!)],
            isShowBorder: true,
            // isShowValue: true,
          ),
        );
      }

      //title
      containerList.insert(
        0,
        GridContainer(
          gridHeight: gridHeight,
          gridWidth: gridWidth,
          value: widget.xTitle[i],
          textColor: widget.titleTextColor,
          isShowBorder: false,
          isShowValue: true,
        ),
      );
      Column column = Column(
        children: containerList,
      );
      columnList.add(column);
    }

    /////////////= false////////
    return columnList;
  }

  Widget generateColorBar() {
    List<Widget> wholeColorList = [];
    List<Widget> wholeRangeList = [];

    List<Widget> containerColorList = [];
    List<Widget> containerRangeList = [];
    double gap = widget.max / colorRangeSteps!;

    double gridWidth =
        (MediaQuery.of(context).size.width - a.APPStyleSheet.pageHorizontalMargin.w * 2 - a.APPStyleSheet.cardHorizontalPadding.w * 2) /
            (widget.data.keys.length + 1);

    wholeColorList.add(Container(
      width: gridWidth,
    ));
    wholeRangeList.add(Container(
      width: gridWidth,
    ));
    for (int i = 0; i < colorList!.length; i++) {
      containerColorList.add(
        Container(
          decoration: BoxDecoration(
            color: colorList![i],
            border: Border.all(
              color: Color(0xff2c2c2e), //border color
              width: .5,
            ),
          ),
          height: 10,
          width: ((MediaQuery.of(context).size.width -
                  gridWidth -
                  a.APPStyleSheet.pageHorizontalMargin.w * 2 -
                  a.APPStyleSheet.cardHorizontalPadding.w * 2) /
              (colorList!.length)),
        ),
      );

      if (i == colorList!.length - 1) {
        containerRangeList.add(Container(
          width: ((MediaQuery.of(context).size.width -
                  gridWidth -
                  a.APPStyleSheet.pageHorizontalMargin.w * 2 -
                  a.APPStyleSheet.cardHorizontalPadding.w * 2) /
              (colorList!.length)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.translate(
                  offset: Offset(-3.0, 0),
                  child: Text(
                    (gap * i).ceil().toString(),
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  )),
              Transform.translate(
                  offset: Offset(3.0, 0),
                  child: Text(
                    widget.max.ceil().toString() + "+",
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ))
            ],
          ),
        ));
      } else {
        containerRangeList.add(
          Transform.translate(
            offset: Offset(-3.0, 0),
            child: Container(
                width: ((MediaQuery.of(context).size.width -
                        gridWidth -
                        a.APPStyleSheet.pageHorizontalMargin.w * 2 -
                        a.APPStyleSheet.cardHorizontalPadding.w * 2) /
                    (colorList!.length)),
                child: Text(
                  (gap * i).ceil().toString(),
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                )),
          ),
        );
      }
    }

    wholeColorList.add(Row(
      children: containerColorList,
    ));
    wholeRangeList.add(Row(
      children: containerRangeList,
    ));
    return Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: wholeColorList,
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: wholeRangeList,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.colorList == null) {
      colorRangeSteps = widget.colorRangeSteps;
      generateColorList();
    } else {
      colorList = widget.colorList;
      colorRangeSteps = colorList!.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: generateColumnList(),
        ),
        generateColorBar(),
      ],
    );
  }
}

class GridContainer extends StatelessWidget {
  final double? gridHeight;
  final double? gridWidth;
  final String? value;
  final Color? bgColor;
  final Color? textColor;
  final bool isShowBorder;
  final bool isShowValue;
  GridContainer({
    this.gridHeight,
    this.gridWidth,
    this.value,
    this.bgColor,
    this.textColor,
    this.isShowBorder = false,
    this.isShowValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: isShowBorder
            ? Border.all(
                color: Color(0xff2c2c2e), //border color
                width: .5,
              )
            : null,
      ),
      height: gridHeight,
      width: gridWidth,
      child: Center(
        child: value != null
            ? Text(
                isShowValue ? value! : '',
                style: Theme.of(context).primaryTextTheme.subtitle1,
              )
            : Container(),
      ),
    );
  }
}
