import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/presentation/modules/controllers/task_controller.dart';
import 'package:task_manager/app/presentation/modules/widgets/drawer_task.dart';
import 'package:task_manager/app/routes/app_routes.dart';

class SeeRecords extends StatelessWidget {
  final TaskController controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerTask(),
        appBar: AppBar(
          title: Text("Crear tareas", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: (const Color.fromARGB(255, 35, 113, 248)),
        ),
        body: Obx(
          () => ListView.builder(
              itemBuilder: (context, index) {
                final tarea = controller.listaTareas[index];
                return ListTile(
                  title: Text(tarea.nombreTarea.string),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prioridad',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(tarea.prioridad.string),
                      Text('Duracion tarea',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(tarea.duracionMinutos.toString())
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Eliminar",
                          middleText: "Eliminar la tarea de la lista?",
                          textConfirm: "Si",
                          textCancel: "No",
                          onConfirm: () {
                            controller.removeTask(index);
                            Get.back();
                          },
                          onCancel: () {
                            Get.back();
                          },
                        );
                      },
                      icon: Icon(Icons.delete_forever)),
                );
              },
              itemCount: controller.listaTareas.length),
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.home);
            },
            icon: Icon(Icons.arrow_back),
            iconSize: 60,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 48, 47, 47),
              backgroundColor: const Color.fromARGB(255, 255, 136, 136),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            )));
  }
}
