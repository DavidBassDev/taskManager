import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var nombre = 'User'.obs;

  final TextEditingController nombreController = TextEditingController();

  updateName() {
    nombre.value = nombreController.text;
    Get.snackbar('Actualizado', 'El nombre se ha actuaizado correctamente');

    update();
    nombreController.clear();
  }
}
