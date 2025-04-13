import 'package:get/get.dart';
import 'package:task_manager/app/routes/app_pages.dart';

class TaskModel {
  var nombreTarea = ''.obs;
  var duracionMinutos = 0.0.obs;
  var prioridad = ''.obs;

  TaskModel(String nombre, double duracion, String prioridad) {
    nombreTarea.value = nombre;
    duracionMinutos.value = duracion;
    this.prioridad.value = prioridad;
  }
}
