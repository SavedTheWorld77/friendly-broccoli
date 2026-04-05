// import 'package:dev_portfolio/theme/app_colors.dart';
import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:dev_portfolio/widgets/hover_card.dart';
import 'package:dev_portfolio/widgets/nav_text.dart';
import 'package:dev_portfolio/widgets/phone_widget.dart';
import 'package:dev_portfolio/widgets/responsive_layout_widget.dart';
import 'package:dev_portfolio/widgets/section_layout.dart';
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
            style: AppTextScale.of(context).scale(
              textTheme.bodyLarge!.copyWith(
                color: color.primary,
                fontFamily: AppTypography.spaceMono,
              ),
            ),
          ),
        ),
        leadingWidth: 160.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: _buildDivider(),
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
        padding: EdgeInsets.only(top: 90 + 64.0, bottom: 128.0),
        child: Column(
          spacing: 64.0,
          children: [
            ResponsiveLayoutWidget(
              phone: _firstSectionPhone(color, textTheme, listTileColor),
              desktop: _firstSectionWeb(color, textTheme, listTileColor),
            ),
            _buildDivider(),
            _buildSecondSection(),
          ],
        ),
      ),
    );
  }

  _techCard(String iconString, String title, String description) {
    final color = Theme.of(context).colorScheme;

    final textTheme = Theme.of(context).textTheme;

    final listTileColor = Theme.of(context).listTileTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Text(iconString, style: TextStyle(fontSize: 21)),
        Text(
          title,
          style: AppTextScale.of(context).scale(
            textTheme.labelLarge!.copyWith(
              color: color.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: null,
            ),
          ),
        ),
        Text(
          description,
          style: AppTextScale.of(context).scale(
            textTheme.labelMedium!.copyWith(
              color: listTileColor.iconColor,
              fontFamily: AppTypography.sora,
              letterSpacing: null,
            ),
          ),
        ),
      ],
    );
  }

  _buildSecondSection() {
    return SectionLayout(
      child: Column(
        spacing: 64.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionName(
            overline: 'tech stack',
            headline: 'tools of the trade',
          ),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: [
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '🐦',
                  title: 'Flutter',
                  description: 'primary framework',
                ),
              ),
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '🎯',
                  title: 'Dart',
                  description: 'language',
                ),
              ),
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '🔥',
                  title: 'Firebase',
                  description: 'Firestore · Auth · Storage',
                ),
              ),
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '🧱',
                  title: 'BLoC / Cubit',
                  description: 'state management',
                ),
              ),
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '🗄️',
                  title: 'Drift ORM',
                  description: 'local SQLite',
                ),
              ),
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '🔀',
                  title: 'GoRouter',
                  description: 'navigation',
                ),
              ),
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '🚀',
                  title: 'Codemagic',
                  description: 'CI/CD',
                ),
              ),
              SizedBox(
                width: 180,
                height: 140,
                child: SkillHoverCard(
                  iconString: '☁️',
                  title: 'Cloud Functions',
                  description: 'backend logic',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildOverline(String text) {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return Text(
      text,
      style: AppTextScale.of(context).scale(
        textTheme.labelSmall!.copyWith(
          color: listTileColor.iconColor,
          letterSpacing: 3.0,
        ),
      ),
    );
  }

  _buildHeadline(String text) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: AppTextScale.of(
        context,
      ).scale(textTheme.displayMedium!.copyWith(color: Colors.white)),
    );
  }

  _buildSectionName({required String overline, required String headline}) {
    return Column(
      spacing: 12.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildOverline(overline), _buildHeadline(headline)],
    );
  }

  Container _buildDivider() {
    final color = Theme.of(context).colorScheme;
    return Container(height: 1, color: color.outline);
  }

  _firstSectionWeb(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return SectionLayout(
      child: Row(
        children: [
          Expanded(child: _buildIntro(color, textTheme, listTileColor)),
          _buildPhone(),
        ],
      ),
    );
  }

  _firstSectionPhone(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return SectionLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24.0,
        children: [
          _buildIntroPhone(color, textTheme, listTileColor),
          _buildPhone(),
        ],
      ),
    );
  }

  Stack _buildPhone() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PhoneWidget(),
        Positioned(right: 0, bottom: -20, child: TabletWidget()),
      ],
    );
  }

  Column _buildIntro(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return Column(
      spacing: 24.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _roleTitle(color, textTheme),
        _headline(textTheme, color),
        Text(
          'I craft cross-platform mobile and web experiences with\nFlutter and Firebase — clean architecture, smooth\nanimations, real-world performance.',
          style: AppTextScale.of(context).scale(
            textTheme.bodyLarge!.copyWith(color: listTileColor.iconColor),
          ),
        ),
        _actionButtons(color, textTheme),
      ],
    );
  }

  Row _actionButtons(ColorScheme color, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildViewProjectsButton(color, textTheme),
        _buildDownloadCVButton(color, textTheme),
      ],
    );
  }

  Padding _buildIntroPhone(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 24.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _roleTitle(color, textTheme),
          _headline(textTheme, color),
          Text(
            'I craft cross-platform mobile and web experiences with\nFlutter and Firebase — clean architecture, smooth\nanimations, real-world performance.',
            style: AppTextScale.of(context).scale(
              textTheme.bodyLarge!.copyWith(color: listTileColor.iconColor),
            ),
          ),
          _actionButtons(color, textTheme),
        ],
      ),
    );
  }

  RichText _headline(TextTheme textTheme, ColorScheme color) {
    return RichText(
      text: TextSpan(
        text: 'Building apps\nthat feel',
        style: AppTextScale.of(
          context,
        ).scale(textTheme.displayLarge!.copyWith(color: Colors.white)),
        children: [
          TextSpan(
            text: ' native',
            style: AppTextScale.of(
              context,
            ).scale(textTheme.displayLarge!.copyWith(color: color.primary)),
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
          style: AppTextScale.of(context).scale(
            textTheme.bodyMedium!.copyWith(
              color: color.secondary,
              letterSpacing: 3.0,
            ),
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
          style: AppTextScale.of(
            context,
          ).scale(textTheme.labelLarge!.copyWith(color: color.primary)),
        ),
      ),
    );
  }

  Container _buildViewProjectsButton(ColorScheme color, TextTheme textTheme) {
    return Container(
      margin: EdgeInsets.only(right: 24.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            // if (states.contains(WidgetState.hovered)) {
            //   // Optional hover color
            //   return color.primary.withValues(alpha: 0.3);
            // }
            return color.primary;
          }),

          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
        ),
        child: Text(
          'view projects',
          style: AppTextScale.of(context).scale(
            textTheme.labelLarge!.copyWith(
              color: Colors.black,
              fontFamily: AppTypography.spaceMono,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Container _buildDownloadCVButton(ColorScheme color, TextTheme textTheme) {
    final listTileColor = Theme.of(context).listTileTheme;
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
              side: BorderSide(
                color: listTileColor.iconColor ?? Colors.white,
                width: 1.5,
              ),
            ),
          ),
        ),
        child: Text(
          'download cv',
          style: AppTextScale.of(context).scale(
            textTheme.labelLarge!.copyWith(
              color: Colors.white,
              fontFamily: AppTypography.spaceMono,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets responsivePadding() {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      // phone
      return const EdgeInsets.symmetric(horizontal: 32);
    } else if (width < 1024) {
      // tablet
      return const EdgeInsets.symmetric(horizontal: 64);
    } else {
      // desktop
      return const EdgeInsets.symmetric(horizontal: 128);
    }
  }
}
