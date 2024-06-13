import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    super.key,
    required this.title,
    this.widget,
  });
  final String title;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextSharedWidget(
            text: title,
            style: AppTextStyle.boldPlusStyle.copyWith(
              fontSize: 14.sp,
              color: AppColor.appBarbackGroundColor,
            ),
          ),
          widget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
