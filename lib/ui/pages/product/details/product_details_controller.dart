import 'package:binding/domain/entities/product.dart';
import 'package:binding/ui/controllers/bag_controller.dart';
import 'package:binding/ui/pages/product/shopping/shopping_controller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  Product? product;

  var quantity = 0.obs;
  var parcialPrice = 0.0.obs;

  void setProduct(Product product) {
    this.product = product;
    quantity.value = 1;
    parcialPrice.value = product.price.toDouble();
    update();
  }

  void increaseQuantity() {
    quantity.value++;
    final productPrice = product?.price ?? 0.0;
    parcialPrice.value = (productPrice * quantity.value).toDouble();
  }

  void decreaseQuantity() {
    if(quantity.value<=1) return;
    quantity.value--;
    final productPrice = product?.price ?? 0.0;
    parcialPrice.value = (productPrice * quantity.value).toDouble();
  }

  void addToBag(){
    print('--------------------------------------');
    print('Agregando producto a la bolsa');
    print(product?.title??'');
    print('Cantidad: ${quantity.value}');
    print('Monto parcial: ${parcialPrice.value}');
    print('--------------------------------------');

    //Obtenemos el controllador de la bolsa de compras
    final bagController = Get.find<ShoppingController>();

    bagController.addItem(product!, quantity.value);
  }
  
}
