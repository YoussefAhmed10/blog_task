// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextSharedWidget extends StatelessWidget {
  TextSharedWidget({
    super.key,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.textColor,
  });
  double? fontSize;
  String? text;
  TextStyle? style;
  int? maxLines;
  TextOverflow? overflow;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      overflow: overflow,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
    );
  }
}
