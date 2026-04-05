import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:flutter/material.dart';

class NavText extends StatefulWidget {
  const NavText({super.key, required this.label, required this.onTap});
  final String label;
  final Function() onTap;

  @override
  State<NavText> createState() => _NavTextState();
}

class _NavTextState extends State<NavText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click, // 👈 shows hand cursor
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: AppTextScale.of(context).scale(textTheme.bodyLarge!.copyWith(
            color: isHovered ? Colors.white : listTileColor.iconColor,
          )),
        ),
      ),
    );
  }
}
