import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedSharedButtonWidget extends StatelessWidget {
  const ElevatedSharedButtonWidget({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.textButtonColor,
    this.buttoncircularRadius,
    this.buttonFontSized,
    required this.buttonText,
    required this.onPressed,
    this.borderside,
    this.style,
  });

  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final Color? textButtonColor;
  final double? buttoncircularRadius;
  final double? buttonFontSized;
  final String? buttonText;
  final void Function()? onPressed;
  final TextStyle? style;
  final BorderSide? borderside;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? 311.w,
      height: buttonHeight ?? 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttoncircularRadius ?? 27),
            side: borderside == null
                ? BorderSide.none
                : BorderSide(
                    color: const Color(0xffE4E4E7),
                    width: 1.w,
                  ),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: TextSharedWidget(
            text: buttonText!,
            style: style ??
                AppTextStyle.boldPlusStyle.copyWith(
                  fontSize: 14.sp,
                  color: textButtonColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
