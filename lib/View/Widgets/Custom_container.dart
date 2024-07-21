import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final double borderRadius;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BoxShadow? boxShadow;
  final BoxShape? shape;

  const CustomContainer({super.key, 
    required this.width,
    required this.height,
    required this.color,
    this.borderRadius = 20.0,
    required this.child,
    this.padding,
    this.shape,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow != null ? [boxShadow!] : [],
      ),
      padding: padding,
      child: child,
    );
  }
}
