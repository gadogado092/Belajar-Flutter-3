import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sirs_wahidin/controllers/cart_controller.dart';
import 'package:sirs_wahidin/controllers/shopping_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selamat Datang"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (shoppingController) {
                return ListView.builder(
                    itemCount: shoppingController.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                shoppingController.products[index].productName),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      cartController.addToCart(
                                          shoppingController.products[index]);
                                    },
                                    child: const Text("Add")),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text('Total amount: ${controller.totalPrice}');
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: const Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.cartItems.length.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 24),
            );
          })),
    );
  }
}
