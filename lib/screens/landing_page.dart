// import 'package:dev_portfolio/theme/app_colors.dart';
import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/nav_text.dart';
import 'package:dev_portfolio/widgets/phone_widget.dart';
import 'package:dev_portfolio/widgets/tablet_widget.dart';
import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Text(
            "// rhen.dev",
            style: textTheme.bodyLarge?.copyWith(
              color: color.primary,
              fontFamily: AppTypography.spaceMono,
            ),
          ),
        ),
        leadingWidth: 160.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: color.outline),
        ),
        toolbarHeight: 90.0,
        centerTitle: true,
        title: Row(
          spacing: 24.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavText(label: 'work', onTap: () {}),
            NavText(label: 'stack', onTap: () {}),
            NavText(label: 'about', onTap: () {}),
          ],
        ),
        actions: [_hireMeButton(color, textTheme)],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 90 + 64.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 64.0,
              children: [
                Column(
                  spacing: 24.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _roleTitle(color, textTheme),
                    _headline(textTheme, color),
                    Text(
                      'I craft cross-platform mobile and web experiences with\nFlutter and Firebase — clean architecture, smooth\nanimations, real-world performance.',
                      style: textTheme.bodyLarge?.copyWith(
                        color: listTileColor.iconColor,
                      ),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    PhoneWidget(),
                    Positioned(right: -40, bottom: -20, child: TabletWidget()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  RichText _headline(TextTheme textTheme, ColorScheme color) {
    return RichText(
      text: TextSpan(
        text: 'Building apps\nthat feel',
        style: textTheme.displayLarge?.copyWith(color: Colors.white),
        children: [
          TextSpan(
            text: ' native',
            style: textTheme.displayLarge?.copyWith(color: color.primary),
          ),
        ],
      ),
    );
  }

  Row _roleTitle(ColorScheme color, TextTheme textTheme) {
    return Row(
      spacing: 12.0,
      children: [
        Container(
          height: 1.0,
          width: 32.0,
          decoration: BoxDecoration(color: color.secondary),
        ),
        Text(
          'flutter developer',
          style: textTheme.bodyMedium?.copyWith(
            color: color.secondary,
            letterSpacing: 3.0,
          ),
        ),
      ],
    );
  }

  Container _hireMeButton(ColorScheme color, TextTheme textTheme) {
    return Container(
      margin: EdgeInsets.only(right: 24.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              // Optional hover color
              return color.primary.withValues(alpha: 0.3);
            }
            return Colors.transparent;
          }),

          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(color: color.primary, width: 1.5),
            ),
          ),
        ),
        child: Text(
          'hire me',
          style: textTheme.labelLarge?.copyWith(color: color.primary),
        ),
      ),
    );
  }
}
