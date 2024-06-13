import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/data/models/posts_list_model/posts_list_model.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/elevated_shared_button_widget.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/navigation_routing.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_field_shared_widget.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../domain/posts_provider/posts_provider.dart';

class EditBlogPage extends StatefulWidget {
  const EditBlogPage({
    super.key,
    required this.posts,
  });
  final PostsListModel posts;
  @override
  State<EditBlogPage> createState() => _EditBlogPageState();
}

class _EditBlogPageState extends State<EditBlogPage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController.text = widget.posts.title!;

    bodyController.text = widget.posts.body!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarbackGroundColor,
        title: TextSharedWidget(
          text: 'Edit Blog',
          style: AppTextStyle.mediumPlusStyle.copyWith(
            color: AppColor.whiteColor,
            fontSize: 18.sp,
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
          top: 16.0.h,
          left: 18.w,
          bottom: 11.h,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                TextSharedWidget(
                  text: 'Titel',
                  style: AppTextStyle.semiBoldPlusStyle.copyWith(
                    color: AppColor.appBarbackGroundColor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                TextFormFieldSharedWidget(
                  fieldController: titleController,
                  cursorColor: AppColor.appBarbackGroundColor,
                  hintText: 'Please enter blog title',
                  fieldmaxLine: 2,
                ),
                SizedBox(height: 15.h),
                TextSharedWidget(
                  text: 'Content',
                  style: AppTextStyle.semiBoldPlusStyle.copyWith(
                    color: AppColor.appBarbackGroundColor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                TextFormFieldSharedWidget(
                  fieldController: bodyController,
                  textFieldHeight: 131.h,
                  hintText: 'Please enter blog content',
                  fieldmaxLine: 7,
                  cursorColor: AppColor.appBarbackGroundColor,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          Consumer<PostsProvider>(builder: (context, postsParams, _) {
        return Container(
          width: 414.w,
          height: 77.h,
          color: AppColor.whiteColor,
          child: Center(
            child: ElevatedSharedButtonWidget(
              buttonText: 'Edit Blog',
              buttonColor: AppColor.appBarbackGroundColor,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  postsParams.editPosts(
                    postId: widget.posts.id,
                    title: titleController.text,
                    body: bodyController.text,
                    userId: widget.posts.userId,
                  );
                  context.read<PostsProvider>().getPosts(isStart: false);

                  // NavigationRouting.navigateionPop(context: context);
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
