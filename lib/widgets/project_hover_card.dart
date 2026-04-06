import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:dev_portfolio/widgets/card_action_button.dart';
import 'package:dev_portfolio/widgets/hover_card.dart';
import 'package:dev_portfolio/widgets/portfolio_badget.dart';
import 'package:dev_portfolio/widgets/responsive_layout_widget.dart';
import 'package:flutter/material.dart';

class ProjectHoverCard extends StatefulWidget {
  const ProjectHoverCard({
    super.key,
    required this.title,
    required this.description,
    required this.projectTag,
    this.tags = const [],
  });
  final String title;
  final String description;
  final ProjectTag projectTag;
  final List<String> tags;

  @override
  State<ProjectHoverCard> createState() => _ProjectHoverCardState();
}

class _ProjectHoverCardState extends State<ProjectHoverCard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutWidget(
      phone: Container(),
      desktop: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 350),
        child: HoverCard(
          onHovered: (hovered) {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12.0,
              children: [
                _buildTitleAndTag(),
                _buildFeaturedDesc(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildTags()),
                    CardActionButton(label: 'view', onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTitleAndTag() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildHeadline()),
        _buildBadge(),
      ],
    );
  }

  PortfolioBadge _buildBadge() {
    switch (widget.projectTag) {
      case ProjectTag.dualPortal:
        return _buildDualPortalTag();
      case ProjectTag.liveFintech:
        return _buildLiveFintechTag();
      case ProjectTag.eCommerce:
        return _buildECommerceTag();
      case ProjectTag.saasAiPowered:
        return _buildSaasAIPoweredTag();
      case ProjectTag.offlineFirst:
        return _buildOfflineFirstTag();
      case ProjectTag.utility:
        return _buildUtilityTag();
      case ProjectTag.available:
        return _buildAvailableTag();
    }
  }

  Text _buildFeaturedDesc() {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;

    return Text(
      widget.description,
      style: AppTextScale.of(context).scale(
        textTheme.bodyLarge!.copyWith(
          color: listTileColor.iconColor,
          fontSize: 12.0,
        ),
      ),
    );
  }

  PortfolioBadge _buildDualPortalTag() {
    final color = Theme.of(context).colorScheme;
    return PortfolioBadge(label: 'dual-portal', color: color.primary);
  }

  PortfolioBadge _buildLiveFintechTag() {
    final color = Theme.of(context).colorScheme;
    return PortfolioBadge(label: 'live · fintech', color: color.secondary);
  }

  PortfolioBadge _buildECommerceTag() {
    final color = Theme.of(context).colorScheme;
    return PortfolioBadge(label: 'e-commerce', color: color.tertiary);
  }

  PortfolioBadge _buildSaasAIPoweredTag() {
    final color = Theme.of(context).colorScheme;
    return PortfolioBadge(label: 'saas · ai-powered', color: color.primary);
  }

  PortfolioBadge _buildOfflineFirstTag() {
    final color = Theme.of(context).colorScheme;
    return PortfolioBadge(label: 'offline-first', color: color.secondary);
  }

  PortfolioBadge _buildUtilityTag() {
    final color = Theme.of(context).colorScheme;
    return PortfolioBadge(label: 'utility', color: color.tertiary);
  }

  PortfolioBadge _buildAvailableTag() {
    final color = Theme.of(context).colorScheme;
    return PortfolioBadge(label: 'available', color: color.primary);
  }

  Wrap _buildTags() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      runAlignment: WrapAlignment.start,
      children: widget.tags.map((tag) => _buildTag(tag)).toList(),
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

  Text _buildHeadline() {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      widget.title,
      style: AppTextScale.of(context).scale(
        textTheme.displayMedium!.copyWith(color: Colors.white, fontSize: 21.0),
      ),
    );
  }
}

enum ProjectTag {
  offlineFirst,
  utility,
  available,
  dualPortal,
  liveFintech,
  eCommerce,
  saasAiPowered,
}
