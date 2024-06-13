import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/domain/posts_provider/posts_provider.dart';
import 'package:flutter_blogs_tassk/presentation/pages/home_page/home_page.dart';
import 'package:flutter_blogs_tassk/presentation/shared/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostsProvider(),
      child: MaterialApp(
        title: 'Blogs Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColor.whiteColor,
          cardColor: AppColor.whiteColor,
          cardTheme: CardTheme(
            color: AppColor.whiteColor,
          ),
        ),
        home: const ScreenUtilInit(
          designSize: Size(375, 812),
          child: HomePage(),
        ),
      ),
    );
  }
}
