import 'package:get/get.dart';
import 'package:task_manager/app/presentation/modules/view/create_record.dart';
import 'package:task_manager/app/presentation/modules/view/home_ui.dart';
import 'package:task_manager/app/presentation/modules/view/my_profile.dart';
import 'package:task_manager/app/presentation/modules/view/see_records.dart';
import 'package:task_manager/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeUi(),
    ),
    GetPage(
      name: AppRoutes.createRecord,
      page: () => CreateRecord(),
    ),
    GetPage(
      name: AppRoutes.seeRecord,
      page: () => SeeRecords(),
    ),
    GetPage(
      name: AppRoutes.myProfile,
      page: () => MyProfile(),
    )
  ];
}
