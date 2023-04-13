import 'package:binding/domain/entities/product.dart';
import 'package:binding/domain/repositories/products_repository.dart';
import 'package:binding/ui/pages/product/details/product_details_controller.dart';
import 'package:binding/ui/pages/product/details/product_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProductListController extends GetxController {

  List<Product> products = <Product>[].obs;

  ProductsRepository repository;
  
  ProductListController(this.repository){
    getProducts();
  }

  void getProducts() async {
    final respProducts = await repository.getProducts();
    products.addAll(respProducts);
    print(products);
  }

  void openDetailProduct(BuildContext context, Product product) {
    final ProductDetailsController con = Get.find<ProductDetailsController>();
        con.setProduct(product);
        showMaterialModalBottomSheet(
            context: context, builder: (_) => const ProductDetailsPage());
  }

  void goToShoppingBag(){
    Get.toNamed('/shopping');
  }

}