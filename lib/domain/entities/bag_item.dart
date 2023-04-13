import 'package:binding/domain/entities/product.dart';

class BagItem {
  Product product;
  int quantity;

  BagItem({required this.product, required this.quantity});
}
