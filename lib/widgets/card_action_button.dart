import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CardActionButton extends StatefulWidget {
  const CardActionButton({super.key, required this.onTap, required this.label});

  final VoidCallback onTap;
  final String label;

  @override
  State<CardActionButton> createState() => _CardActionButtonState();
}

class _CardActionButtonState extends State<CardActionButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          '→ ${widget.label}',
          style: AppTypography.monoNav.copyWith(
            color: cs.primary.withValues(alpha: _hovered ? 1.0 : 0.7),
          ),
        ),
      ),
    );
  }
}
