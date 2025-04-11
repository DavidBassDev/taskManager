import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/data/models/models/task_model.dart';

class TaskController extends GetxController {
  var nombreTarea = ''.obs;
  var duracionMinutos = 0.0.obs;
  var prioridad = ''.obs;
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
        TaskModel tarea = TaskModel(
            nombreTarea: nombreController.text,
            duracionMinutos: duracion,
            prioridad: prioridadController.text);
        addToList(tarea);
      } //aca creo el registro
    } else {
      Get.snackbar('Revisa la info!', 'Todos los campos deben estar llenos');
    }
  }

  addToList(TaskModel tarea) {
    listaTareas.add(tarea);

    Get.snackbar('Exito!', 'Tarea agregada a la lista');
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
    nombreTarea = "Lavar Ropa".obs;
    duracionMinutos = 60.0.obs;
    prioridad = 'Media'.obs;
    TaskModel tarea = TaskModel(
        nombreTarea: nombreTarea.string,
        duracionMinutos: duracionMinutos.value,
        prioridad: prioridad.string);
    addToList(tarea);
    //2
    nombreTarea = "Barrer y trapear".obs;
    duracionMinutos = 40.0.obs;
    prioridad = 'Media'.obs;
    TaskModel tarea2 = TaskModel(
        nombreTarea: nombreTarea.string,
        duracionMinutos: duracionMinutos.value,
        prioridad: prioridad.string);
    addToList(tarea2);

    //3
    nombreTarea = "Cocinar".obs;
    duracionMinutos = 120.0.obs;
    prioridad = 'Alta'.obs;
    TaskModel tarea3 = TaskModel(
        nombreTarea: nombreTarea.string,
        duracionMinutos: duracionMinutos.value,
        prioridad: prioridad.string);
    addToList(tarea3);

    //4
    nombreTarea = "Sacar basura".obs;
    duracionMinutos = 10.0.obs;
    prioridad = 'baja'.obs;
    TaskModel tarea4 = TaskModel(
        nombreTarea: nombreTarea.string,
        duracionMinutos: duracionMinutos.value,
        prioridad: prioridad.string);
    addToList(tarea4);

    //5
    nombreTarea = "Realizar talleres universidad".obs;
    duracionMinutos = 120.0.obs;
    prioridad = 'Media'.obs;
    TaskModel tarea5 = TaskModel(
        nombreTarea: nombreTarea.string,
        duracionMinutos: duracionMinutos.value,
        prioridad: prioridad.string);
    addToList(tarea5);

    Get.snackbar('Lista cargada!', 'se han cargado tareas de ejemplo');
  }
}
