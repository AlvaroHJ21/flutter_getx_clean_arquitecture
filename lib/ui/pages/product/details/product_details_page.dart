import 'package:binding/ui/pages/product/details/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsController con = Get.find<ProductDetailsController>();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _ImagesSlider(
              images: con.product?.images ?? [],
            ),
            _InfoProduct(
              title: con.product?.title ?? '',
              description: con.product?.description ?? '',
              price: con.product?.price.toDouble() ?? 0.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonsController(),
    );
  }
}

class ButtonsController extends StatelessWidget {
  const ButtonsController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.find<ProductDetailsController>();

    return Obx(() => Container(
          height: 100,
          // color: Colors.indigo[50],
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () => con.decreaseQuantity(),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10)),
                child: const Icon(Icons.remove),
              ),
              Text(
                '${con.quantity}',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () => con.increaseQuantity(),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10)),
                child: const Icon(Icons.add),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => con.addToBag(),
                  child: Text('Agregar ${con.parcialPrice}'),
                ),
              )
            ],
          ),
        ));
  }
}

class _InfoProduct extends StatelessWidget {
  final String title;
  final String description;
  final double price;

  const _InfoProduct({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
      // color: Colors.indigo[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 30),
              ),
              const Spacer(),
              Text(
                'S/$price',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(description),
        ],
      ),
    );
  }
}

class _ImagesSlider extends StatelessWidget {
  final List<String> images;

  const _ImagesSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: images
              .map((url) => Image(
                    image: NetworkImage(url),
                    width: 320,
                    height: 400,
                    fit: BoxFit.cover,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
