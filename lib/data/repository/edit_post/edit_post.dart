import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/data/models/posts_list_model/posts_list_model.dart';
import 'package:flutter_blogs_tassk/data/network/api_calls.dart';
import 'package:flutter_blogs_tassk/data/network/end_point_const.dart';

class EditPostsRepo {
  Future<PostsListModel> editPosts({
    required String? title,
    required String? body,
    required int? postId,
    required int? userId,
  }) async {
    Map<String, dynamic> postNewData = {
      "title": title,
      "body": body,
      "userId": userId,
      "id": postId,
    };
    log(postNewData.toString());
    final response = await APICall().putData(
      url: "${BASE_URL + POSTS}/$postId",
      data: json.encode(postNewData),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    final jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse.toString());
    return PostsListModel.fromJson(jsonResponse);
  }
}
