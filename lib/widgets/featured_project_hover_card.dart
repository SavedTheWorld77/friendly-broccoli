import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:dev_portfolio/widgets/hover_card.dart';
import 'package:dev_portfolio/widgets/responsive_layout_widget.dart';
import 'package:flutter/material.dart';

class FeaturedProjectHoverCard extends StatefulWidget {
  const FeaturedProjectHoverCard({super.key});

  @override
  State<FeaturedProjectHoverCard> createState() =>
      _FeaturedProjectHoverCardState();
}

class _FeaturedProjectHoverCardState extends State<FeaturedProjectHoverCard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutWidget(
      phone: Container(),
      desktop: HoverCard(
        onHovered: (hovered) {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12.0,
            children: [
              _buildOverline(),
              Row(
                spacing: 32.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildFirstSection()),

                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: _statsGrid(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statsGrid() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: _buildStatCard("2", Colors.blue, "portals")),
            SizedBox(width: 12),
            Expanded(child: _buildStatCard("∞", Colors.green, "rooms managed")),
          ],
        ),

        SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _buildStatCard("RT", Colors.orange, "real-time sync"),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard("CI", Colors.cyan, "automated deploy"),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildFirstSection() {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildHeadline(), _buildFeaturedDesc(), _buildTags()],
    );
  }

  Text _buildFeaturedDesc() {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;

    return Text(
      '''Hotel and airline management platform for distressed passenger operations. Dual-portal system — hotel staff and airline agents — with real-time room inventory, dynamic pricing templates, and partner relationship management. Ships on both web and Android.''',
      style: AppTextScale.of(context).scale(
        textTheme.bodyLarge!.copyWith(
          color: listTileColor.iconColor,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Wrap _buildTags() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      runAlignment: WrapAlignment.start,
      children: [
        _buildTag('Flutter Web'),
        _buildTag('Android'),
        _buildTag('IOS'),
        _buildTag('Firebase'),
        _buildTag('BloC'),
        _buildTag('GoRouter'),
        _buildTag('Codemagic CI/CD'),
      ],
    );
  }

  Container _buildTag(String text) {
    final color = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Text(
        text,
        style: AppTextScale.of(context).scale(
          AppTypography.monoBadge.copyWith(color: color.onSurfaceVariant),
        ),
      ),
    );
  }

  Container _buildStatCard(String label, Color labelColor, String statTitle) {
    final color = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        spacing: 8.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTextScale.of(
              context,
            ).scale(AppTypography.monoStat.copyWith(color: labelColor)),
          ),
          Text(
            statTitle,
            style: AppTextScale.of(context).scale(
              AppTypography.monoMeta.copyWith(color: color.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildHeadline() {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'PaxAide',
      style: AppTextScale.of(context).scale(
        textTheme.displayMedium!.copyWith(color: Colors.white, fontSize: 21.0),
      ),
    );
  }

  Row _buildOverline() {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 12.0,
      children: [
        Icon(Icons.star, color: color.secondary, size: 8.0),
        Text(
          'featured project',
          style: AppTextScale.of(context).scale(
            textTheme.labelSmall!.copyWith(
              color: color.secondary,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ],
    );
  }
}
