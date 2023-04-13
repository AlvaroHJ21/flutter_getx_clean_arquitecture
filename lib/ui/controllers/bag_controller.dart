import 'package:binding/domain/entities/bag_item.dart';
import 'package:binding/domain/entities/product.dart';
import 'package:get/get.dart';

class BagController extends GetxController {
  List<BagItem> bagItems = <BagItem>[].obs;

  void addItem(Product product, int quantity) {
    bagItems.add(BagItem(product: product, quantity: quantity));
  }

  int getCountItem(){
    return bagItems.length;
  }
}
