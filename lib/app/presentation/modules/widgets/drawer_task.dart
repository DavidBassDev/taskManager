import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/routes/app_routes.dart';

class DrawerTask extends StatelessWidget {
  const DrawerTask({super.key});

  @override
  Widget build(Object context) {
    return Drawer(
        child: ListView(
      children: [
        ListTile(
          title: Text('Mi perfil'),
          onTap: () {
            Get.toNamed(AppRoutes.myProfile);
          },
        )
      ],
    ));
  }
}
