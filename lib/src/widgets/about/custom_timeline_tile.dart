import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineTile extends StatefulWidget {
  const CustomTimelineTile({
    this.isFirst = false,
    this.isLast = false,
    this.isStartChild = true,
    required this.programName,
    required this.schoolName,
    required this.year,
    this.isHorizontal = true,
    this.isOnMobile = false,
    this.isVisible = false,
    Key? key,
  }) : super(key: key);

  final bool isFirst;
  final bool isLast;
  final bool isStartChild;
  final String programName;
  final String schoolName;
  final String year;
  final bool isHorizontal;
  final bool isOnMobile;
  final bool isVisible;

  @override
  State<CustomTimelineTile> createState() => _CustomTimelineTileState();
}

class _CustomTimelineTileState extends State<CustomTimelineTile> {
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis:
          widget.isHorizontal ? TimelineAxis.horizontal : TimelineAxis.vertical,
      alignment: TimelineAlign.center,
      isFirst: widget.isFirst,
      isLast: widget.isLast,
      indicatorStyle: IndicatorStyle(
        width: widget.isOnMobile ? 20 : 15.0,
        height: widget.isOnMobile ? 20 : 15.0,
        color: AppColor.educationLineColor,
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: Icons.fiber_manual_record,
          fontSize: widget.isOnMobile ? 12 : 10,
        ),
      ),
      beforeLineStyle: LineStyle(
        color: AppColor.educationLineColor,
        thickness: 5,
      ),
      startChild: widget.isStartChild
          ? Container(
              constraints: BoxConstraints(
                minHeight: widget.isOnMobile ? 80 : 120,
                minWidth: ResponsiveValue(
                  context,
                  defaultValue: 120.0,
                  valueWhen: [
                    const Condition.smallerThan(
                      name: DESKTOP,
                      value: 100.0,
                    ),
                  ],
                ).value!,
              ),
              child: Visibility(
                visible: widget.isVisible,
                child: DelayedDisplay(
                  delay: Duration(milliseconds: widget.isOnMobile ? 0 : 1800),
                  fadingDuration:
                      Duration(milliseconds: widget.isOnMobile ? 1000 : 1300),
                  slidingBeginOffset: Offset(
                    widget.isOnMobile ? -0.2 : 0.0,
                    widget.isOnMobile ? 0 : -0.2,
                  ),
                  child: Row(
                    mainAxisAlignment: widget.isOnMobile
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(right: widget.isOnMobile ? 20 : 0),
                        child: Column(
                            mainAxisAlignment: widget.isOnMobile
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: ResponsiveValue(
                                  context,
                                  defaultValue: 0.0,
                                  valueWhen: const [
                                    Condition.smallerThan(
                                      name: DESKTOP,
                                      value: 10.0,
                                    ),
                                  ],
                                ).value!,
                              ),

                              Center(
                                child: Text(
                                  widget.programName,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ResponsiveValue(
                                      context,
                                      defaultValue: 16.0,
                                      valueWhen: [
                                        Condition.smallerThan(
                                          name: DESKTOP,
                                          value:
                                              widget.isOnMobile ? 12.0 : 11.0,
                                        ),
                                      ],
                                    ).value,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              Center(
                                child: Text(
                                  widget.schoolName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ResponsiveValue(
                                        context,
                                        defaultValue: 13.0,
                                        valueWhen: [
                                          Condition.smallerThan(
                                            name: DESKTOP,
                                            value:
                                                widget.isOnMobile ? 12.0 : 11.0,
                                          ),
                                        ],
                                      ).value,
                                      color: Colors.black45),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              //date
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.calendar_month_outlined,
                                        size: ResponsiveValue(
                                          context,
                                          defaultValue: 15.0,
                                          valueWhen: [
                                            Condition.smallerThan(
                                              name: DESKTOP,
                                              value: widget.isOnMobile
                                                  ? 13.0
                                                  : 12.0,
                                            ),
                                          ],
                                        ).value,
                                        color: Colors.black45),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.year,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ResponsiveValue(
                                            context,
                                            defaultValue: 13.0,
                                            valueWhen: [
                                              Condition.smallerThan(
                                                name: DESKTOP,
                                                value: widget.isOnMobile
                                                    ? 12.0
                                                    : 11.0,
                                              ),
                                            ],
                                          ).value,
                                          color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox(),
      endChild: widget.isStartChild
          ? const SizedBox()
          : Container(
              constraints: BoxConstraints(
                minHeight: widget.isOnMobile ? 80 : 120,
                minWidth: ResponsiveValue(
                  context,
                  defaultValue: 120.0,
                  valueWhen: const [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: 100.0,
                    ),
                  ],
                ).value!,
              ),
              child: Visibility(
                visible: widget.isVisible,
                child: DelayedDisplay(
                  delay: Duration(milliseconds: widget.isOnMobile ? 0 : 1800),
                  fadingDuration:
                      Duration(milliseconds: widget.isOnMobile ? 1000 : 1300),
                  slidingBeginOffset: Offset(
                      widget.isOnMobile ? 0.2 : 0, widget.isOnMobile ? 0 : 0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: widget.isOnMobile ? 20 : 0,
                            top: widget.isOnMobile ? 0 : 10),
                        child: Column(
                            mainAxisAlignment: widget.isOnMobile
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: ResponsiveValue(
                                  context,
                                  defaultValue: 0.0,
                                  valueWhen: const [
                                    Condition.smallerThan(
                                      name: DESKTOP,
                                      value: 10.0,
                                    ),
                                  ],
                                ).value!,
                              ),

                              Center(
                                child: Text(
                                  widget.programName,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ResponsiveValue(
                                      context,
                                      defaultValue: 16.0,
                                      valueWhen: [
                                        Condition.smallerThan(
                                          name: DESKTOP,
                                          value:
                                              widget.isOnMobile ? 12.0 : 11.0,
                                        ),
                                      ],
                                    ).value,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              Center(
                                child: Text(
                                  widget.schoolName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ResponsiveValue(
                                        context,
                                        defaultValue: 13.0,
                                        valueWhen: [
                                          Condition.smallerThan(
                                            name: DESKTOP,
                                            value:
                                                widget.isOnMobile ? 12.0 : 11.0,
                                          ),
                                        ],
                                      ).value,
                                      color: Colors.black45),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              //date
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.calendar_month_outlined,
                                        size: ResponsiveValue(
                                          context,
                                          defaultValue: 15.0,
                                          valueWhen: [
                                            Condition.smallerThan(
                                              name: DESKTOP,
                                              value: widget.isOnMobile
                                                  ? 13.0
                                                  : 12.0,
                                            ),
                                          ],
                                        ).value,
                                        color: Colors.black45),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.year,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ResponsiveValue(
                                            context,
                                            defaultValue: 13.0,
                                            valueWhen: [
                                              Condition.smallerThan(
                                                name: DESKTOP,
                                                value: widget.isOnMobile
                                                    ? 12.0
                                                    : 11.0,
                                              ),
                                            ],
                                          ).value,
                                          color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              // color: Colors.amberAccent,
            ),
    );
  }
}
