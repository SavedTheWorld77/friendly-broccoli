import 'package:flutter/material.dart';

enum _Scale { compact, medium, expanded }

_Scale _scaleFor(double width) {
  if (width < 600) return _Scale.compact;
  if (width < 1024) return _Scale.medium;
  return _Scale.expanded;
}

const _kScaleFactors = {
  _Scale.compact:  0.85,
  _Scale.medium:   1.00,
  _Scale.expanded: 1.15,
};

class AppTextScale extends InheritedWidget {
  const AppTextScale({
    super.key,
    required this.factor,
    required super.child,
  });

  final double factor;

  TextStyle scale(TextStyle style) {
    final base = style.fontSize ?? 14;
    return style.copyWith(
      fontSize: (base * factor).clamp(10.0, 72.0),
    );
  }

  static AppTextScale of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTextScale>();
    assert(result != null, 'No AppTextScale found in context.');
    return result!;
  }

  static Widget builder({required Widget child}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 0
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;
        final scale = _scaleFor(width);
        final factor = _kScaleFactors[scale]!;
        return AppTextScale(factor: factor, child: child);
      },
    );
  }

  @override
  bool updateShouldNotify(AppTextScale old) => factor != old.factor;
}