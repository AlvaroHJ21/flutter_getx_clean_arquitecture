import 'package:binding/ui/controllers/bag_controller.dart';
import 'package:binding/ui/pages/counter/counter_controller.dart';
import 'package:binding/ui/pages/home/home_page.dart';
import 'package:binding/ui/pages/product/list/product_list_page.dart';
import 'package:binding/ui/pages/product/shopping/shopping_controller.dart';
import 'package:binding/ui/pages/product/shopping/shopping_page.dart';
import 'package:get/get.dart';

const initialRoute = '/home';

final initialBinding = BindingsBuilder(() {
  Get.put(CounterController());
  Get.put(ShoppingController());
});

final routes = [
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    binding: BindingsBuilder(() {
      // Get.put(CounterController());
    }),
  ),
  GetPage(
    name: '/product-list',
    page: () => const ProductListPage(),
    // binding: ProductListBinding(),
    // binding: BindingsBuilder((){
    //   Get.lazyPut<ProductListController>(()=>ProductListController());
    // })
  ),
  GetPage(
    name: '/shopping',
    page: () => const ShoppingPage(),
  ),
];
