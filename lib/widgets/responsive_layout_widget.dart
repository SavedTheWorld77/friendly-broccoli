import 'package:dev_portfolio/utils/breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutWidget extends StatelessWidget {
  const ResponsiveLayoutWidget({
    super.key,
    this.phone,
    this.tablet,
    this.desktop,
  });
  final Widget? phone;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < Breakpoints.mobile) {
      return phone ?? const SizedBox.shrink();
    }

    if (width < Breakpoints.tablet) {
      return tablet ?? phone ?? const SizedBox.shrink();
    }

    return desktop ?? tablet ?? phone ?? const SizedBox.shrink();
  }
}
