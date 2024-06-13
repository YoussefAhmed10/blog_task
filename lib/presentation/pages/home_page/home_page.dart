import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/domain/posts_provider/posts_provider.dart';
import 'package:flutter_blogs_tassk/presentation/pages/create_new_blog/create_new_blog.dart';
import 'package:flutter_blogs_tassk/presentation/pages/edit_blog/edit_blog.dart';
import 'package:flutter_blogs_tassk/presentation/pages/home_page/widgets/post_item_card.dart';
import 'package:flutter_blogs_tassk/presentation/pages/home_page/widgets/shimmer_request_card.dart';
import 'package:flutter_blogs_tassk/presentation/pages/post_item_details_page/post_item_details.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_text_style.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/navigation_routing.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_field_shared_widget.dart';
import 'package:flutter_blogs_tassk/presentation/shared/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    searchController.addListener(_onSearchChanged);

    context.read<PostsProvider>().getPosts(isStart: false);
    super.initState();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<PostsProvider>().filterPosts(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarbackGroundColor,
        title: TextSharedWidget(
          text: 'Home Page',
          style: AppTextStyle.mediumPlusStyle.copyWith(
            color: AppColor.whiteColor,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                NavigationRouting.navigateTo(
                  context: context,
                  screenName: const CreateNewBlogScreen(),
                );
              },
              child: SvgPicture.asset(
                'assets/images/add_new_post.svg',
                width: 27.w,
                height: 27.h,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        child: Column(
          children: [
            TextFormFieldSharedWidget(
              fieldController: searchController,
              hintText: 'Search for blogs',
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
                color: Color(0xff52525B),
              ),
              cursorColor: AppColor.primaryColor,
              onChange: (value) {
                setState(() {});

                context.read<PostsProvider>().filterPosts(value);
              },
              suffixIcon: searchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        if (searchController.text.isNotEmpty) {
                          setState(() {
                            context.read<PostsProvider>().filterPosts('');
                            searchController.clear();
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: AppColor.grayColor,
                      ),
                    ),
            ),
            SizedBox(height: 10.h),
            context.watch<PostsProvider>().isLoading
                ? SizedBox(
                    height: 500.h,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          const ShimmerPostCardWidget(),
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                    ),
                  )
                : Expanded(
                    child: Consumer<PostsProvider>(
                      builder: (context, postsParams, _) {
                        final posts = searchController.text.isEmpty
                            ? postsParams.posts
                            : postsParams.filteredPosts;

                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                NavigationRouting.navigateTo(
                                  context: context,
                                  screenName: PostItemDetailsPage(
                                    posts: posts[index],
                                  ),
                                );
                              },
                              child: PostItemCard(
                                posts: posts[index],
                                onTap: () {
                                  NavigationRouting.navigateTo(
                                    context: context,
                                    screenName: EditBlogPage(
                                      posts: posts[index],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.h);
                          },
                          itemCount: posts.length,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
