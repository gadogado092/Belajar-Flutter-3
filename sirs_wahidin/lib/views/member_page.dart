import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sirs_wahidin/controllers/member_controller.dart';

class MemberPage extends StatelessWidget {
  MemberPage({ Key? key }) : super(key: key);

  final memberController = Get.put(MemberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetX<MemberController>(
          builder: (controller) {
            return Text("Member Page ${memberController.user.value.name}");
          }
        ),
      ),
    );
  }
}