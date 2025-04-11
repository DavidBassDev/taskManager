// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/presentation/modules/controllers/task_controller.dart';
import 'package:task_manager/app/presentation/modules/controllers/user_controller.dart';
import 'package:task_manager/app/routes/app_pages.dart';
import 'package:task_manager/app/routes/app_routes.dart';

void main() {
  final TaskController controller = Get.put(TaskController());
  final UserController userController = Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}
