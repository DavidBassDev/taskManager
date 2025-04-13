import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/data/models/models/task_model.dart';

class TaskController extends GetxController {
  var listaTareas = <TaskModel>[].obs;
  var prioridadSeleccionada = 'Baja'.obs;
  List<String> prioridades = ['Alta', 'Media', 'Baja'];

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController duracionController = TextEditingController();
  final TextEditingController prioridadController = TextEditingController();

  createTaskItem() {
    if (nombreController.text.isNotEmpty &&
        duracionController.text.isNotEmpty &&
        prioridadController.text.isNotEmpty) {
      double? duracion = double.tryParse(duracionController.text);
      if (duracion == null) {
        Get.snackbar('Revisa la info!', 'Las horas deben ser numeros.');
      } else {
        TaskModel taskmodel = TaskModel(nombreController.value.text, duracion,
            prioridadController.value.text);
        addToList(taskmodel,
            2); //aca le paso valor para que el usuario vea que si se creo
      }
    } else {
      Get.snackbar('Revisa la info!', 'Todos los campos deben estar llenos');
    }
  }

  addToList(TaskModel tarea, int? time) {
    listaTareas.add(tarea);
    time ??=
        0; // aca hago esto para saber si viene del metodo crear lista de ejemplo, para que no dure mucho en pantalla
    Get.snackbar('Exito!', 'Tarea agregada a la lista',
        duration: Duration(seconds: time));
    nombreController.clear();
    duracionController.clear();
    prioridadController.clear();
    update();
  }

  removeTask(int index) {
    listaTareas.removeAt(index);
    update();
  }

  createExamplesTask() {
    TaskModel taskmodel = TaskModel("Lavar ropa", 120.0, "media");

    addToList(taskmodel, null);
    //2
    TaskModel taskmodel2 = TaskModel("Barrer y trapear", 40.0, "media");

    addToList(taskmodel2, null);

    //3
    TaskModel taskmodel3 = TaskModel("Cocinar", 120, "media");

    addToList(taskmodel3, null);

    //4
    TaskModel taskmodel4 = TaskModel("Sacar basura", 10.0, "baja");

    addToList(taskmodel4, null);

    //5
    TaskModel taskmodel5 =
        TaskModel("Realizar talleres universidad", 120.2, "Media");

    addToList(taskmodel5, null);

    Get.snackbar('Lista cargada!', 'se han cargado tareas de ejemplo');
  }
}
