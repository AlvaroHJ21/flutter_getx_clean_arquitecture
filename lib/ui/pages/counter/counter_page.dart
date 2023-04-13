import 'package:binding/ui/pages/counter/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final CounterController con = Get.find<CounterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Obx(()=>Text(
            'Counter: ${con.counter.value}',
            style: const TextStyle(fontSize: 30),
          ),),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => con.decrease(),
                  // onPressed: () {},
                  child: const Icon(Icons.remove)),
              ElevatedButton(
                  onPressed: () => con.increase(),
                  // onPressed: () {},
                  child: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
