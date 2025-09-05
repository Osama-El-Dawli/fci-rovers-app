import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, this.borderWidth = 2, this.radius = 30});

  final double borderWidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffffffff).withValues(alpha: .3),
      radius: radius + borderWidth,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        backgroundImage: const AssetImage('assets/images/logo.png'),
      ),
    );
  }
}
