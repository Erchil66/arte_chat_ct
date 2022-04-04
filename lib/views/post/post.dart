import 'package:chat/constants/colors.dart';
import 'package:chat/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostViews extends GetView<PostController> {
  const PostViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: decentWhite,
    );
  }
}
