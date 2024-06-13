import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blogs_tassk/data/models/posts_list_model/posts_list_model.dart';
import 'package:flutter_blogs_tassk/data/repository/create_post/create_post.dart';
import 'package:flutter_blogs_tassk/data/repository/edit_post/edit_post.dart';
import 'package:flutter_blogs_tassk/data/repository/get_posts_repo/get_posts_repo.dart';

class PostsProvider extends ChangeNotifier {
  List<PostsListModel> posts = [];
  List<PostsListModel> filteredPosts = [];

  bool isLoading = false;
  GetPostsRepo postsRepo = GetPostsRepo();
  CreatePostsRepo createRepo = CreatePostsRepo();
  EditPostsRepo editRepo = EditPostsRepo();

  Future<List<PostsListModel>> getPosts({bool? isStart}) async {
    isLoading = true;
    isStart == false ? null : notifyListeners();
    try {
      var listOfPosts = await postsRepo.getPosts();
      posts = listOfPosts;
      log(posts.toString());
      notifyListeners();
      isLoading = false;
      notifyListeners();
      return posts;
    } catch (e) {
      print(e.toString());
      print(e);
      isLoading = false;
      notifyListeners();
      return [];
    }
  }

  void filterPosts(String query) {
    if (query.isEmpty) {
      filteredPosts = posts;
      notifyListeners();
    } else {
      filteredPosts = posts
          .where(
            (post) => post.title!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<PostsListModel> createPosts({
    bool? isStart,
    required String? title,
    required String? body,
  }) async {
    isLoading = true;
    isStart == false ? null : notifyListeners();
    try {
      var postCreation = await createRepo.createPosts(
        title: title,
        body: body,
      );

      isLoading = false;
      notifyListeners();
      return postCreation;
    } catch (e) {
      print(e.toString());
      print(e);
      isLoading = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  Future<PostsListModel> editPosts({
    bool? isStart,
    required String? title,
    required String? body,
    required int? postId,
    required int? userId,
  }) async {
    isLoading = true;
    isStart == false ? null : notifyListeners();
    try {
      var postCreation = await editRepo.editPosts(
        title: title,
        body: body,
        postId: postId,
        userId: userId,
      );
      isLoading = false;
      notifyListeners();
      return postCreation;
    } catch (e) {
      print(e.toString());
      print(e);
      isLoading = false;
      notifyListeners();
      throw Exception(e);
    }
  }
}
