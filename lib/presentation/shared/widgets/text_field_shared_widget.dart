// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldSharedWidget extends StatefulWidget {
  TextFormFieldSharedWidget({
    this.fieldController,
    this.textFieldHeight,
    this.textFieldWidth,
    this.isReadOnly = false,
    this.fieldmaxLine,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.focusedBorder,
    this.enabledBorder,
    this.mainborder,
    this.showPassowrd = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.onChange,
    this.onEditetd,
    this.focusNode,
    this.cursorColor,
    this.styleColor,
    super.key,
  });
  final double? textFieldHeight;
  final double? textFieldWidth;
  final bool? isReadOnly;
  final bool? showPassowrd;
  TextEditingController? fieldController;
  final int? fieldmaxLine;
  final String? hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  InputBorder? focusedBorder;
  InputBorder? enabledBorder;
  InputBorder? mainborder;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  void Function(String)? onChange;
  void Function()? onEditetd;
  FocusNode? focusNode;
  Color? cursorColor;
  Color? styleColor;
  @override
  State<TextFormFieldSharedWidget> createState() =>
      _TextFormFieldSharedWidgetState();
}

class _TextFormFieldSharedWidgetState extends State<TextFormFieldSharedWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: textFieldHeight ?? 50.h,
      width: widget.textFieldWidth ?? 377.w,
      child: TextFormField(
        focusNode: widget.focusNode,
        textAlignVertical: TextAlignVertical.center,
        readOnly: widget.isReadOnly ?? false,
        controller: widget.fieldController,
        maxLines: widget.fieldmaxLine ?? 1,
        obscureText: widget.showPassowrd!,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        onChanged: widget.onChange,
        cursorColor: widget.cursorColor ?? Colors.white,
        onEditingComplete: widget.onEditetd,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              AppTextStyle.regularPlusStyle
                  .copyWith(color: AppColor.hintTextFormFieldColor),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          focusedBorder: widget.focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.textFormFieldBorderColor,
                  width: 1.0.w,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
          enabledBorder: widget.enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.textFormFieldBorderColor,
                  width: 1.0.w,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
          border: widget.mainborder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.textFormFieldBorderColor,
                  width: 1.0.w,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
        ),
      ),
    );
  }
}
