import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
         child: Text('HomePage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          Get.toNamed('/product-list');
        },
        child: const Icon(Icons.arrow_right),
      )
    );
  }
}