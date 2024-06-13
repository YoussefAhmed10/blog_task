import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerPostCardWidget extends StatelessWidget {
  const ShimmerPostCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 10),
      interval: const Duration(seconds: 10),
      color: Colors.grey,
      colorOpacity: 0.4,
      enabled: true,
      direction: const ShimmerDirection.fromLTRB(),
      child: Card(
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
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0.w,
                    top: 8.h,
                  ),
                ),
                SizedBox(
                  height: 69.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7.h),
                      Shimmer(
                        duration: const Duration(seconds: 10),
                        interval: const Duration(seconds: 10),
                        color: Colors.grey,
                        colorOpacity: 0.4,
                        enabled: true,
                        direction: const ShimmerDirection.fromLTRB(),
                        child: Container(
                          width: 160.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Shimmer(
                        duration: const Duration(seconds: 10),
                        interval: const Duration(seconds: 10),
                        color: Colors.grey,
                        colorOpacity: 0.4,
                        enabled: true,
                        direction: const ShimmerDirection.fromLTRB(),
                        child: Container(
                          width: 160.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 22.h),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 5.0.h,
                        right: 7.w,
                      ),
                      child: Row(
                        children: [
                          Shimmer(
                            duration: const Duration(seconds: 10),
                            interval: const Duration(seconds: 10),
                            color: Colors.grey,
                            colorOpacity: 0.4,
                            enabled: true,
                            direction: const ShimmerDirection.fromLTRB(),
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.04),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
