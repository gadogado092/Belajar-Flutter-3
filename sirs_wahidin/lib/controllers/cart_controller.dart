import 'package:get/get.dart';
import 'package:sirs_wahidin/models/product.dart';

class CartController extends GetxController {
  List<Product> cartItems = List<Product>.empty(growable: true).obs;
  double get totalPrice =>
      cartItems.fold(0, (sum, element) => sum + element.price);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
