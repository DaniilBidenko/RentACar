import 'package:flutter/material.dart';

class GradientText extends StatelessWidget{

  final String text;
  final TextStyle? textStyle;
  final Gradient gradient;

  const GradientText(
    this.text, {
      required this.gradient,
      this.textStyle
    });

    @override
    Widget build(BuildContext context) {
      return ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(100, 1, 0, 0),
        ),
        child: Text(text, style: textStyle),
      );
    }
}