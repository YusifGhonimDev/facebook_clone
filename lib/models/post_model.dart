import 'package:flutter/material.dart';

class PostModel {
  final String? imagePath;
  final String? username;
  String? postText;
  String? timePosted;
  int? numOfLikes;
  bool? isLiked = false;
  Color? buttonColor = Colors.grey;

  PostModel(
      {this.imagePath,
      this.username,
      this.postText,
      this.timePosted,
      this.numOfLikes});
}
