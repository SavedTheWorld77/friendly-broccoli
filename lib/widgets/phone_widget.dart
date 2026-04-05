import 'package:dev_portfolio/theme/app_colors.dart';
import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PhoneWidget extends StatefulWidget {
  const PhoneWidget({super.key});

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final phoneHeight = screenHeight * 0.7;
    final phoneWidth = phoneHeight * 9 / 19.5; // phone aspect ratio
    final u = phoneWidth / 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: phoneHeight,
              width: phoneWidth,
              decoration: BoxDecoration(
                color: color.surface,
                borderRadius: BorderRadius.circular(32.0),
                border: Border.all(width: 2.0, color: Color(0xFF2A3140)),
              ),
              padding: EdgeInsets.all(phoneWidth * 0.03),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: color.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _notch(color),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: color.primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "P",
                                      style: AppTextScale.of(context).scale(
                                        textTheme.bodyLarge!.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "PaxAide",
                                  style: AppTextScale.of(context).scale(
                                    textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.menu,
                                  color: listTileColor.iconColor,
                                ),
                              ],
                            ),
                            Gap(24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 12.0,
                              children: [
                                Expanded(
                                  child: _statCard(
                                    '142',
                                    color.primary,
                                    'bookings today',
                                  ),
                                ),
                                Expanded(
                                  child: _statCard(
                                    '87%',
                                    Color(0xFF00C896),
                                    'occupancy',
                                  ),
                                ),
                              ],
                            ),
                            Gap(24.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'RECENT ROOMS',
                                style: AppTextScale.of(context).scale(
                                  textTheme.labelLarge!.copyWith(
                                    fontFamily: AppTypography.spaceMono,
                                    color: listTileColor.iconColor,
                                  ),
                                ),
                              ),
                            ),
                            Gap(12.0),
                            _roomCard(
                              'Room 201 - Standard',
                              PhoneRoomStatus.avail,
                            ),
                            _roomCard(
                              'Room 305 - Deluxe',
                              PhoneRoomStatus.booked,
                            ),
                            _roomCard('Suite 501', PhoneRoomStatus.hold),
                            _roomCard('Room 118 - Twin', PhoneRoomStatus.avail),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _roomCard(String label, PhoneRoomStatus status) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    late Color dotColor;

    switch (status) {
      case PhoneRoomStatus.avail:
        dotColor = Color(0xFF00C896);
      case PhoneRoomStatus.booked:
        dotColor = AppColors.amber400;
      case PhoneRoomStatus.hold:
        dotColor = color.primary;
    }

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: color.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(radius: 6.0, backgroundColor: dotColor),
          Gap(12.0),
          Expanded(
            child: Text(
              label,
              style: AppTextScale.of(context).scale(
                textTheme.labelLarge!.copyWith(color: listTileColor.iconColor),
              ),
            ),
          ),
          status == PhoneRoomStatus.avail
              ? Icon(Icons.check, color: Colors.white, size: 14.0)
              : SizedBox.shrink(),
          Gap(6.0),
          Text(
            status.name,
            style: AppTextScale.of(
              context,
            ).scale(textTheme.labelLarge!.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Container _statCard(String label, Color labelColor, String description) {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Color(0x1454C5F8),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Color(0x2654C5F8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextScale.of(context).scale(
              textTheme.bodyMedium!.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: labelColor,
              ),
            ),
          ),
          Text(
            description,
            style: AppTextScale.of(context).scale(
              textTheme.labelLarge!.copyWith(color: listTileColor.iconColor),
            ),
          ),
        ],
      ),
    );
  }

  Container _notch(ColorScheme color) {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        color: color.surfaceContainerLow,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
    );
  }
}

enum PhoneRoomStatus { avail, booked, hold }

extension DoubleX on double {
  double toU(double d) => (this / d) * 100;
}
