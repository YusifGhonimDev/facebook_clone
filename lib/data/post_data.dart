import 'package:flutter/material.dart';

class PostData {
  String? imagePath;
  String? username;
  String? postText;
  String? timePosted;
  int? numOfLikes;
  bool? isLiked;
  Color? buttonColor;

  PostData(
      {this.imagePath,
      this.username,
      this.postText,
      this.timePosted,
      this.numOfLikes,
      this.isLiked,
      this.buttonColor});
}
