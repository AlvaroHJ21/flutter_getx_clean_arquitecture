import 'package:binding/data/local/local_products_repository.dart';
import 'package:binding/domain/entities/product.dart';
import 'package:binding/ui/pages/product/details/product_details_controller.dart';
import 'package:binding/ui/pages/product/list/product_list_controller.dart';
import 'package:binding/ui/pages/product/shopping/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Agregamos el controlador de los detalles de los productos
    Get.put(ProductDetailsController());

    //Agregamos el controlador del listado de productos
    final ProductListController con =
        Get.put(ProductListController(LocalProductsRepository()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [_ButtonIconBag()],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
              children: con.products
                  .map((product) => _ProductCard(
                        product: product,
                      ))
                  .toList()),
        ),
      ),
    );
  }
}

class _ButtonIconBag extends StatelessWidget {
  const _ButtonIconBag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtenemos el controllador de la bolsa de compras
    final shoppingController = Get.find<ShoppingController>();

    //Obtenemos el controllador del listado de productos
    final listController = Get.find<ProductListController>();
    return Obx(() => Row(
          children: [
            Text('${shoppingController.getCountItem()}'),
            IconButton(
                onPressed: () => listController.goToShoppingBag(),
                icon: const Icon(Icons.shopping_bag)),
          ],
        ));
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<ProductListController>().openDetailProduct(context, product);
      },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(product.images[0]),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'S/${product.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
