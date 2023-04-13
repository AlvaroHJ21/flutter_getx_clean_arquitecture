import 'package:binding/domain/entities/bag_item.dart';
import 'package:binding/ui/pages/product/shopping/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.find<ShoppingController>();

    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Shopping bag'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: shoppingController.bagItems
                  .map((item) => _CardBagItem(item: item))
                  .toList(),
            ),
          ),
          bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 100,
              child: Row(
                children: [
                  Text(
                    'Total: ${shoppingController.total}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () => shoppingController.sendOrder(),
                        child: Text('Realizar pedido')),
                  )
                ],
              )),
        ));
  }
}

class _CardBagItem extends StatelessWidget {
  final BagItem item;

  const _CardBagItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = item.product;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(product.images[0]),
                width: 80,
                height: 80,
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
                    item.product.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  _ButtonsController(bagItem: item)
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'S/${product.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

class _ButtonsController extends StatelessWidget {
  final BagItem bagItem;

  const _ButtonsController({
    Key? key,
    required this.bagItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.find<ShoppingController>();

    return Container(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => shoppingController.decreaseQuantity(bagItem),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), padding: const EdgeInsets.all(5)),
            child: const Icon(Icons.remove),
          ),
          Text(
            '${bagItem.quantity}',
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () => shoppingController.increaseQuantity(bagItem),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), padding: const EdgeInsets.all(5)),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
