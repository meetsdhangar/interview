import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Controller/userController.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController())..getuserdata();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: controller.userlist[0].address.street),
            )
          ],
        ),
      ),
    ));
  }
}
