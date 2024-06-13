import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/data/models/posts_list_model/posts_list_model.dart';
import 'package:flutter_blogs_tassk/data/network/api_calls.dart';
import 'package:flutter_blogs_tassk/data/network/end_point_const.dart';

class CreatePostsRepo {
  Future<PostsListModel> createPosts({
    required String? title,
    required String? body,
  }) async {
    Map<String, dynamic> postData = {
      "title": title,
      "body": body,
      "userId": 1,
    };
    final response = await APICall().postData(
      url: "${BASE_URL + POSTS}",
      data: json.encode(postData),
    );
    final jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse.toString());
    return PostsListModel.fromJson(jsonResponse);
  }
}
