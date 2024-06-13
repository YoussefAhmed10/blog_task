// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DividerSharedWidget extends StatelessWidget {
  DividerSharedWidget({
    super.key,
    this.dividerColor,
    this.dividerHeight,
    this.dividerThickness,
  });

  Color? dividerColor;
  double? dividerHeight;
  double? dividerThickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: dividerColor ?? const Color(0xffF7F7F7),
      height: dividerHeight,
      thickness: dividerThickness,
    );
  }
}
