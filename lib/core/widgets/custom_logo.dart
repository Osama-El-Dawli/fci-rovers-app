import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
    this.borderWidth = 5,
    this.radius = 55,
    this.color,
  });

  final double borderWidth;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final totalSize = (radius + borderWidth) * 2;
    return Container(
      width: totalSize,
      height: totalSize,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        color: color ?? const Color(0xff1A1A1A).withValues(alpha: .3),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}
