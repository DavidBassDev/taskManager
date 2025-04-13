import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/data/models/models/user_model.dart';

class UserController extends GetxController {
  final TextEditingController nombreController = TextEditingController();
  final UserModel usermodel = UserModel();

  updateName() {
    usermodel.nombre.value = nombreController.text;

    Get.snackbar('Actualizado', 'El nombre se ha actualizado correctamente');

    update();
    nombreController.clear();
  }
}
