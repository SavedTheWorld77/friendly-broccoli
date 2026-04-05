import 'package:flutter/material.dart';

class SectionLayout extends StatelessWidget {
  const SectionLayout({super.key, required this.child});

  final Widget child;

  static const double _maxWidth = 1200;

  static double horizontalPadding(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.005;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final padding = (screenWidth * 0.04).clamp(16, 40);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: double.parse(padding.toString()),
          ),
          child: child,
        ),
      ),
    );
  }
}
