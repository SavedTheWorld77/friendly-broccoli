import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:flutter/material.dart';

class SkillHoverCard extends StatefulWidget {
  const SkillHoverCard({
    super.key,
    required this.iconString,
    required this.title,
    required this.description,
    this.onTap,
  });

  final VoidCallback? onTap;
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

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(
            0,
            _hovered ? -6.0 : 0.0,
            0,
          ),
          decoration: BoxDecoration(
            color: color.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: _hovered ? color.primary : color.outline,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
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
        ),
      ),
    );
  }
}
