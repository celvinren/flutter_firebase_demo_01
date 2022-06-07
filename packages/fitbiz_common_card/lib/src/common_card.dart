import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'common_card_base_class.dart';
import 'theme_data.dart';

class CommonCard extends CommonCardBaseClass {
  CommonCard({
    Key? key,
    required String cardTitle,
    required Widget cartTitleIcon,
    required Color? cardPrimaryColor,
    required List<Widget> bodyPageList,
    ArrowTextPart? arrowTextPart,
    String? introduction,
    LearnMore? learnMore,
    double? contentHeight = 100,
    bool isShowArrow = true,
    bool isShowDivider = false,
    Color? cardBackgroundColor = const Color(0xff2C2C2E),
    TextStyle? cartTitleTextStyle,
    TextStyle? introductionTextStyle,
    TextStyle? learnMoreTextStyle,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          cartTitleIcon: cartTitleIcon,
          cardPrimaryColor: cardPrimaryColor,
          bodyPageList: bodyPageList,
          arrowTextPart: arrowTextPart,
          introduction: introduction,
          learnMore: learnMore,
          contentHeight: contentHeight,
          isShowArrow: isShowArrow,
          isShowDivider: isShowDivider,
          cardBackgroundColor: cardBackgroundColor,
          introductionTextStyle:
              introductionTextStyle ?? AppThemeData.summaryPageThemeData().primaryTextTheme.headline5!.copyWith(fontFamily: "Bariol"),
          learnMoreTextStyle: learnMoreTextStyle ?? AppThemeData.summaryPageThemeData().textTheme.headline5!.copyWith(fontFamily: "Bariol"),
          cartTitleTextStyle: cartTitleTextStyle ??
              AppThemeData.summaryPageThemeData().textTheme.headline4!.copyWith(fontFamily: "Bariol", color: cardPrimaryColor),
        );

  @override
  _CommonCardState createState() => _CommonCardState();

  Widget textOnArrow({required String text, TextStyle? textStyle}) {
    return Container(
      constraints: BoxConstraints(minWidth: 65.w, maxWidth: 65.w),
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ??
            AppThemeData.summaryPageThemeData()
                .textTheme
                .subtitle1!
                .copyWith(color: themeColors['default']!.selectAppsSubTitleText, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget arrow() {
    return Container(
      constraints: BoxConstraints(minWidth: 8.w, maxWidth: 8.w),
      // margin: EdgeInsets.only(left: 7.w),
      child: isShowArrow
          ? SvgPicture.asset(
              'assets/images/arrow_right.svg',
              width: 6.w,
            )
          : SizedBox(width: 6.w),
    );
  }

  List<Widget> commonCardArrowPart({String? text}) {
    return [textOnArrow(text: text!), arrow()];
  }
}

class _CommonCardState extends State<CommonCard> {
  int _pageCurrent = 0;
  // bool _isAutoPlay = true;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.cardBackgroundColor,
        borderRadius: BorderRadius.circular(
          7,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 9.h),
      padding: EdgeInsets.all(15.w),
      child: Column(
        children: [
          //title part
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints(minHeight: 30.h, maxHeight: 30.h),
                      child: widget.cartTitleIcon,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Text(
                          widget.cardTitle,
                          overflow: TextOverflow.ellipsis,
                          style: widget.cartTitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //title right part
              Expanded(
                flex: widget.bodyPageList.length > 1 ? 3 : 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.bodyPageList.length > 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.bodyPageList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _controller.animateToPage(entry.key),
                                child: Container(
                                    width: 9.0.sp,
                                    height: 9.0.sp,
                                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _pageCurrent == entry.key ? widget.cardPrimaryColor : Color(0xff9E9EA5),
                                    )),
                              );
                            }).toList(),
                          )
                        : Container(),
                    widget.arrowTextPart?.isShowArrowText == true
                        ? (widget.arrowTextPart?.arrowText != null
                            ? widget.textOnArrow(text: widget.arrowTextPart!.arrowText!)
                            : widget.textOnArrow(text: _pageCurrent == 0 ? "Today" : "Yesterday"))
                        : Container(),
                    widget.isShowArrow ? widget.arrow() : Container(),
                  ],
                ),
              ),
            ],
          ),
          //introduction
          widget.introduction?.length != 0
              ? SizedBox(
                  height: 10.h,
                )
              : Container(),
          widget.introduction != null
              ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                  child: RichText(
                    text: TextSpan(text: widget.introduction, style: widget.introductionTextStyle, children: [
                      widget.learnMore != null
                          ? TextSpan(
                              text: '\n' + widget.learnMore!.title,
                              style: widget.learnMoreTextStyle,
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  widget.learnMore!.learnMoreFunction!();
                                },
                            )
                          : TextSpan(text: ""),
                    ]),
                  ))
              : Container(),
          widget.isShowDivider
              ? Container(
                  child: Divider(
                    color: Color(0xff3b3b3d),
                    height: 5,
                    thickness: 1,
                  ),
                )
              : Container(),
          SizedBox(height: widget.isShowDivider ? 20.h : 15.h),
          //content body
          widget.bodyPageList.length > 1
              ? CarouselSlider(
                  items: widget.bodyPageList,
                  carouselController: _controller,
                  options: CarouselOptions(
                    disableCenter: true,
                    height: widget.contentHeight,
                    viewportFraction: 1.0,
                    // autoPlay: widget.bodyPageList.length > 1 ? _isAutoPlay : false,
                    enlargeCenterPage: false,
                    // aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        // if (reason == CarouselPageChangedReason.manual) {
                        //   _isAutoPlay = false;
                        // }
                        _pageCurrent = index;
                      });
                    },
                  ),
                )
              : widget.bodyPageList[0],
        ],
      ),
    );
  }
}
