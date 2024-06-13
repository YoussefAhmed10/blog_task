import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/data/models/posts_list_model/posts_list_model.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItemCard extends StatelessWidget {
  PostItemCard({
    super.key,
    this.onTap,
    required this.posts,
  });
  final void Function()? onTap;
  final PostsListModel posts;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColor.appBarbackGroundColor,
                width: 4.w,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5.0.w,
                  top: 8.h,
                ),
                child: SizedBox(
                  // width: 86.w,
                  height: 69.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 260.w,
                        child: TextSharedWidget(
                          text: posts.title ?? '',
                          style: AppTextStyle.boldPlusStyle.copyWith(
                            fontSize: 14.sp,
                            color: AppColor.appBarbackGroundColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                      SizedBox(
                        width: 300.w,
                        child: TextSharedWidget(
                          text: posts.body,
                          style: AppTextStyle.semiBoldPlusStyle.copyWith(
                            fontSize: 12.sp,
                            color: AppColor.secondryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 19.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                            color: AppColor.secondryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.edit_outlined,
                              color: AppColor.whiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     bottom: 13.0.h,
                  //     left: 23.w,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       TextSharedWidget(
                  //         text:
                  //             'publication date ${DateFormat("yyyy-MM-dd").format(DateTime.parse(DateTime.now().toString())).toString()} ',
                  //         style: AppTextStyle.semiBoldPlusStyle.copyWith(
                  //           fontSize: 12.sp,
                  //           color: AppColor.secondryColor,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
