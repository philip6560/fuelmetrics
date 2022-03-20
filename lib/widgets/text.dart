import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final double? lineSpacing;
  final TextOverflow textOverflow;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextStyle? style;

  const CustomText({
    Key? key,
    this.text,
    this.fontSize,
    this.lineSpacing,
    this.textOverflow = TextOverflow.ellipsis,
    this.letterSpacing,
    this.fontStyle,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text!,
      key: key,
      style: style ?? TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: lineSpacing,
        fontStyle: fontStyle,
      ),
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}