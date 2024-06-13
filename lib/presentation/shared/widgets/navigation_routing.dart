import 'package:flutter/material.dart';

class NavigationRouting {
  static void navigateTo({
    required BuildContext context,
    required Widget screenName,
  }) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => screenName));
  }

  static void navigateToAndReplacment({
    required BuildContext context,
    required Widget screenName,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screenName),
      (route) => false,
    );
  }

  static void navigateionPop({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }
}
