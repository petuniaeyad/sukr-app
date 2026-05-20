import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.text,
    required this.style,
    required this.onTap,
    this.radius,
    this.border,
  });

  final double height;
  final double width;
  final double? radius;
  final Color color;
  final String text;
  final TextStyle style;
  final VoidCallback onTap;
  final Border? border;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius ?? 35),
        bottomRight: Radius.circular(radius ?? 35),
        bottomLeft: Radius.circular(radius ?? 15),
        topRight: Radius.circular(radius ?? 15),
      ),
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? 35),
            bottomRight: Radius.circular(radius ?? 35),
            bottomLeft: Radius.circular(radius ?? 15),
            topRight: Radius.circular(radius ?? 15),
          ),
          border: border,
          color: color,
        ),
        child: Center(child: Text(text, style: style)),
      ),
    );
  }
}
