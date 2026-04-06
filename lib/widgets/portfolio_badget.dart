import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:flutter/material.dart';

class PortfolioBadge extends StatelessWidget {
  const PortfolioBadge({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 0.5),
      ),
      child: Text(
        label,
        style: AppTypography.monoBadge.copyWith(color: color, fontSize: 12.0),
      ),
    );
  }
}
