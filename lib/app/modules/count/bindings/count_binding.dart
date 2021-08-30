import 'package:get/get.dart';

import '../controllers/count_controller.dart';

class CountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountController>(
      () => CountController(),
    );
  }
}
