import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:dev_portfolio/widgets/hover_card.dart';
import 'package:flutter/material.dart';

class SkillHoverCard extends StatefulWidget {
  const SkillHoverCard({
    super.key,
    required this.iconString,
    required this.title,
    required this.description,
  });
  final String iconString;
  final String title;
  final String description;

  @override
  State<SkillHoverCard> createState() => _SkillHoverCardState();
}

class _SkillHoverCardState extends State<SkillHoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return HoverCard(
      onHovered: (hovered) => setState(() => _hovered = hovered),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Text(widget.iconString, style: TextStyle(fontSize: 21)),
          Text(
            widget.title,
            style: AppTextScale.of(context).scale(
              textTheme.labelLarge!.copyWith(
                color: _hovered ? color.primary : Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: null,
              ),
            ),
          ),
          Text(
            widget.description,
            style: AppTextScale.of(context).scale(
              textTheme.labelMedium!.copyWith(
                color: listTileColor.iconColor,
                fontFamily: AppTypography.sora,
                letterSpacing: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
