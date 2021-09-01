import 'package:get/get.dart';

import 'package:time_pomodoro/app/modules/count/bindings/count_binding.dart';
import 'package:time_pomodoro/app/modules/count/views/count_view.dart';
import 'package:time_pomodoro/app/modules/home/bindings/home_binding.dart';
import 'package:time_pomodoro/app/modules/home/views/home_view.dart';
import 'package:time_pomodoro/app/modules/time/bindings/time_binding.dart';
import 'package:time_pomodoro/app/modules/time/views/time_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.TIME;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    // ignore: always_specify_types
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // ignore: always_specify_types
    GetPage(
      name: _Paths.COUNT,
      page: () => CountView(),
      binding: CountBinding(),
    ),
    // ignore: always_specify_types
    GetPage(
      name: _Paths.TIME,
      page: () => TimeView(),
      binding: TimeBinding(),
    ),
  ];
}
