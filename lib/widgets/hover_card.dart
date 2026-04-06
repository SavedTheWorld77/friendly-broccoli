import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.onHovered,
    required this.child,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Function(bool) onHovered;
  final Widget child;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() {
        _hovered = true;
        widget.onHovered(_hovered);
      }),
      onExit: (_) => setState(() {
        _hovered = false;
        widget.onHovered(_hovered);
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovered ? -6.0 : 0.0, 0),
          decoration: BoxDecoration(
            color: color.surface,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: _hovered ? color.primary : color.outline,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: widget.child,
        ),
      ),
    );
  }
}
