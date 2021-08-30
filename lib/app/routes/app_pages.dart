import 'package:get/get.dart';

import 'package:time_pomodoro/app/modules/count/bindings/count_binding.dart';
import 'package:time_pomodoro/app/modules/count/views/count_view.dart';
import 'package:time_pomodoro/app/modules/home/bindings/home_binding.dart';
import 'package:time_pomodoro/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.COUNT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNT,
      page: () => CountView(),
      binding: CountBinding(),
    ),
  ];
}
