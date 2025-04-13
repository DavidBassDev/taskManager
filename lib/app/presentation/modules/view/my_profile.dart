import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/data/models/models/user_model.dart';
import 'package:task_manager/app/presentation/modules/controllers/user_controller.dart';
import 'package:task_manager/app/routes/app_routes.dart';

class MyProfile extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar nombre de usuario'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150, child: Image.asset('assets/profile.png')),
          Obx(
            () => Text(
                "Hola ${userController.usermodel.nombre}, aqui puedes modificar tu nombre",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 69, 69),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Obx(
                () => TextField(
                  controller: userController.nombreController,
                  decoration: InputDecoration(
                    hintText: userController.usermodel.nombre.string,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {
              //aca modifico el nombre
              userController.updateName();
            },
            label: Text(
              'Actualizar nombre',
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
        ],
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          )),
    );
  }
}
