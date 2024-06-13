import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/domain/posts_provider/posts_provider.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/elevated_shared_button_widget.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/navigation_routing.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_field_shared_widget.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateNewBlogScreen extends StatefulWidget {
  const CreateNewBlogScreen({super.key});

  @override
  State<CreateNewBlogScreen> createState() => _CreateNewBlogScreenState();
}

class _CreateNewBlogScreenState extends State<CreateNewBlogScreen> {
  late TextEditingController titleController;
  late TextEditingController bodyController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarbackGroundColor,
        title: TextSharedWidget(
          text: 'Create New Blog',
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
                  hintText: 'Please enter blog title',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter blog title';
                    }
                    return null;
                  },
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
                  fieldmaxLine: 9,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter blog content';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<PostsProvider>(
        builder: (context, postsParams, _) {
          return Container(
            width: 414.w,
            height: 77.h,
            color: AppColor.whiteColor,
            child: Center(
              child: ElevatedSharedButtonWidget(
                buttonText: 'Create New Blog',
                buttonColor: AppColor.appBarbackGroundColor,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    postsParams
                        .createPosts(
                      title: titleController.text,
                      body: bodyController.text,
                    )
                        .then((value) {
                      context.read<PostsProvider>().getPosts(isStart: false);
                      NavigationRouting.navigateionPop(context: context);
                    });
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
