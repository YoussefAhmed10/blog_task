import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/data/models/posts_list_model/posts_list_model.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/divider_wirget.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/navigation_routing.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItemDetailsPage extends StatelessWidget {
  const PostItemDetailsPage({
    super.key,
    required this.posts,
  });
  final PostsListModel posts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarbackGroundColor,
        title: TextSharedWidget(
          text: 'Post Details',
          style: AppTextStyle.mediumPlusStyle.copyWith(
            color: AppColor.whiteColor,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            NavigationRouting.navigateionPop(context: context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 8.0.w,
          right: 8.h,
          top: 8.w,
          bottom: 4.h,
        ),
        child: Card(
          margin: EdgeInsets.only(
            left: 4.0.w,
            right: 4.h,
            top: 4.w,
          ),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                TextSharedWidget(
                  text: 'Titel',
                  style: AppTextStyle.boldPlusStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColor.appBarbackGroundColor,
                  ),
                ),
                SizedBox(height: 15.h),
                TextSharedWidget(
                  text: posts.title ?? '',
                  style: AppTextStyle.mediumPlusStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColor.hintTextFormFieldColor,
                  ),
                ),
                SizedBox(height: 10.h),
                DividerSharedWidget(
                  dividerThickness: 1,
                  dividerColor: AppColor.secondryColor,
                ),
                SizedBox(height: 15.h),
                TextSharedWidget(
                  text: 'Body',
                  style: AppTextStyle.boldPlusStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColor.appBarbackGroundColor,
                  ),
                ),
                SizedBox(height: 15.h),
                TextSharedWidget(
                  text: posts.body ?? '',
                  textAlign: TextAlign.start,
                  maxLines: 20,
                  style: AppTextStyle.mediumPlusStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColor.hintTextFormFieldColor,
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
