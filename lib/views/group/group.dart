import 'package:chat/constants/colors.dart';
import 'package:chat/controllers/group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupViews extends GetView<GroupController> {
  const GroupViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: black,
    );
  }
}
