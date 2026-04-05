import 'dart:math';

import 'package:flutter/material.dart';

class TabletWidget extends StatefulWidget {
  const TabletWidget({super.key});

  @override
  State<TabletWidget> createState() => _TabletWidgetState();
}

class _TabletWidgetState extends State<TabletWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final listTileColor = Theme.of(context).listTileTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final tabletHeight = screenHeight * 0.15;
    final tabletWidth = tabletHeight * (16 / 10);
    return Transform.rotate(
      angle: 6 * (pi / 180),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: tabletHeight,
                width: tabletWidth,
                decoration: BoxDecoration(
                  color: color.surface,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(width: 2.0, color: Color(0xFF2A3140)),
                ),
                padding: EdgeInsets.all(tabletWidth * 0.03),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: color.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shimmerLine(8.0, 0.5, color.primary),
                        _shimmerLine(8.0, 0.7, listTileColor.iconColor),
                        Expanded(
                          child: Row(
                            spacing: 8.0,
                            children: [
                              Expanded(
                                child: _shimmerBox(
                                  const Color.fromARGB(255, 22, 46, 23),
                                ),
                              ),
                              Expanded(
                                child: _shimmerBox(
                                  const Color.fromARGB(255, 219, 98, 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _shimmerLine(8.0, 0.7, listTileColor.iconColor),
                        _shimmerLine(8.0, 0.3, Colors.green),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  FractionallySizedBox _shimmerLine(
    double height,
    double widthFactor,
    Color? color,
  ) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Container _shimmerBox(Color? color) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}

enum PhoneRoomStatus { avail, booked, hold }
