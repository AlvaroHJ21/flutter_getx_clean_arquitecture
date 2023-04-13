import 'package:binding/domain/entities/bag_item.dart';
import 'package:binding/domain/entities/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  List<BagItem> bagItems = <BagItem>[].obs;

  var total = 0.0.obs;

  void addItem(Product product, int quantity) {
    bagItems.add(BagItem(product: product, quantity: quantity));
  }

  int getCountItem() {
    return bagItems.length;
  }

  void increaseQuantity(BagItem item) {
    final bagTemp = [...bagItems];
    bagItems.clear();
    bagItems.addAll(bagTemp.map((i) {
      if (i.product.id == item.product.id) {
        i.quantity++;
      }
      return i;
    }));

    calcTotal();
  }

  void decreaseQuantity(BagItem item) {
    final bagTemp = [...bagItems];
    bagItems.clear();
    bagItems.addAll(bagTemp.map((i) {
      if (i.product.id == item.product.id && i.quantity > 1) {
        i.quantity--;
      }
      return i;
    }));

    calcTotal();
  }

  void calcTotal() {
    total.value = 0.0;
    bagItems.forEach((item) {
      total.value += item.product.price * item.quantity;
    });
  }

  void sendOrder() {
    print('-----------------------------------------');
    print('Enviando orden');
    print('Items: ');
    bagItems.forEach((item) {
      print('Product: ${item.product.title} Quantity: ${item.quantity}');
    });
    print('Total: ${total.value}');
    print('-----------------------------------------');
  }
}
