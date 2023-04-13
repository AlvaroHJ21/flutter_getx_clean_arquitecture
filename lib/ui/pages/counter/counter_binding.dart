import 'package:binding/ui/pages/counter/counter_controller.dart';
import 'package:get/get.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
