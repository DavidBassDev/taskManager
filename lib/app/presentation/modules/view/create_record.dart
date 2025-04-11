import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/presentation/modules/controllers/task_controller.dart';
import 'package:task_manager/app/presentation/modules/widgets/drawer_task.dart';
import 'package:task_manager/app/routes/app_routes.dart';

// ignore: use_key_in_widget_constructors
class CreateRecord extends StatelessWidget {
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
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                    "Por favor, diligencia los datos solicitados y luego selecciona 'Crear'.",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 60,
                ),
                const Text("Ingresa el nombre de tu tarea",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 69, 69),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: controller.nombreController,
                      decoration: InputDecoration(
                        hintText: "Ejemplo lavar ropa",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Ingresa la duracion de la tarea en minutos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 69, 69),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: controller.duracionController,
                      decoration: InputDecoration(
                        hintText: "ejemplo 120",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Ingresa la prioridad",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 69, 69),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: controller.prioridadController,
                      decoration: InputDecoration(
                        hintText: "Alta - Media - Baja",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                TextButton.icon(
                  onPressed: () {
                    //aca debe agregarlo a la lista
                    controller.createTaskItem();
                  },
                  label: Text(
                    'Agregar',
                    style: TextStyle(fontSize: 23),
                  ),
                  icon: Icon(Icons.add),
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 48, 47, 47),
                      backgroundColor: const Color.fromARGB(255, 255, 136, 136),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('Tareas pendientes',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 255, 69, 69),
                        )),
                  ],
                ),
                SizedBox(height: 10),
                Obx(() => Row(
                      children: [
                        Text(
                          controller.listaTareas.length.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ))
              ],
            )),
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
