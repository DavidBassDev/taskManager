import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/presentation/modules/controllers/task_controller.dart';
import 'package:task_manager/app/presentation/modules/controllers/user_controller.dart';
import 'package:task_manager/app/presentation/modules/widgets/drawer_task.dart';
import 'package:task_manager/app/routes/app_pages.dart';
import 'package:task_manager/app/routes/app_routes.dart';

class HomeUi extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTask(),
      appBar: AppBar(
        title: Text("Bienvenido al gestor de tareas!",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: (const Color.fromARGB(255, 35, 113, 248)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(height: 150, child: Image.asset('assets/taskLogo.png')),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Obx(
              () => Text(
                  "Hola ${userController.usermodel.nombre} , para iniciar por favor selecciona una de las siguientes opciones",
                  style: TextStyle(fontSize: 18)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.createRecord);
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 48, 47, 47),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 136, 136),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        const SizedBox(height: 8),
                        Text(
                          "Crear tarea",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.seeRecord);
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 48, 47, 47),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 136, 136),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.remove_red_eye),
                        const SizedBox(height: 8),
                        Text("Ver tareas",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      taskController.createExamplesTask();
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 48, 47, 47),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 136, 136),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.list),
                        const SizedBox(height: 8),
                        Text("Cargar tareas ejemplo",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          TextButton.icon(
            onPressed: () {
              Get.toNamed(AppRoutes.myProfile);
            },
            label: Text("Mi perfil"),
            icon: Icon(Icons.person),
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 136, 136),
            ),
          ),
          SizedBox(
            width: 100,
          ),
          TextButton.icon(
              onPressed: () {
                Get.toNamed(AppRoutes.seeRecord);
              },
              label: Text("Ver tareas"),
              icon: Icon(Icons.task),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 136, 136),
              )),
        ],
      ),
    );
  }
}
