import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/data/models/posts_list_model/posts_list_model.dart';
import 'package:flutter_blogs_tassk/data/network/api_calls.dart';
import 'package:flutter_blogs_tassk/data/network/end_point_const.dart';

class GetPostsRepo {
  Future<List<PostsListModel>> getPosts() async {
    final response = await APICall().getData(
      url: "${BASE_URL + POSTS}",
    );
    final jsonResponse = json.decode(response.body);

    dynamic parsdList = List<PostsListModel>.from(
      jsonResponse.map(
        (postsList) => PostsListModel.fromJson(postsList),
      ),
    );

    debugPrint(parsdList.toString());
    return parsdList;
  }
}
