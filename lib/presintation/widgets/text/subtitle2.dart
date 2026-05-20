import 'package:flutter/material.dart';

class Subtitle2 extends StatelessWidget {
  const Subtitle2({
    super.key,
    required this.title,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.textDecoration,
    this.color,
    this.fontSize,
  });
  final String title;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? color;
  final double? fontSize;
  @override
  Widget build(BuildContext context) => Text(
    title,
    style:
        style ??
        TextStyle(
          fontWeight: FontWeight.bold,
          color: color ?? Colors.black,
          fontSize: fontSize ?? 12,
        ),
    maxLines: maxLines ?? 1,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign ?? TextAlign.start,
  );
}
