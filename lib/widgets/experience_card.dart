import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard({
    super.key,
    required this.timeline,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
  });
  final String timeline;
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 128.0,
      children: [
        SizedBox(width: 120, child: _buildTimeline()),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              _buildSubtitle(),
              Gap(12.0),
              _buildDescription(),
              Gap(12.0),
              _buildTags(),
            ],
          ),
        ),
      ],
    );
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
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        text,
        style: AppTextScale.of(context).scale(
          AppTypography.monoBadge.copyWith(color: color.onSurfaceVariant),
        ),
      ),
    );
  }

  Text _buildDescription() {
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

  Text _buildTimeline() {
    final listTileColor = Theme.of(context).listTileTheme;

    return Text(
      widget.timeline,
      style: AppTextScale.of(context).scale(
        AppTypography.monoEyebrow.copyWith(
          color: listTileColor.iconColor,
          fontSize: 12.0,
          letterSpacing: 0,
        ),
      ),
    );
  }

  Text _buildTitle() {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      widget.title,
      style: AppTextScale.of(context).scale(
        textTheme.displaySmall!.copyWith(color: Colors.white, fontSize: 21.0),
      ),
    );
  }

  Text _buildSubtitle() {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Text(
      widget.subtitle,
      style: AppTextScale.of(context).scale(
        textTheme.titleMedium!.copyWith(
          color: color.primary,
          fontFamily: AppTypography.spaceMono,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
